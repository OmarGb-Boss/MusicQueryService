using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrapySharp.Extensions;
using HtmlAgilityPack;

namespace MusicQueryService
{
    public class WebScrapingResources
    {
        //para obtener los datos de la web se utilizó la libreria ScrapySharp.Extensions y HtmlAgilityPack
        //genera los resultados de la búsqueda  por web scraping 
        public List<string> utiliti(string Query, string concept, string classe)
        {
            HtmlWeb OWEB = new HtmlWeb();
            HtmlDocument Doc = OWEB.Load(string.Concat(Query, concept));
            string ClearNode = string.Empty;
            List<string> Elements = new List<string>();
            foreach (var gen in Doc.DocumentNode.CssSelect(classe))
            {
                switch (Query)
                {
                    case "https://us.napster.com/search/artist?query=":
                        var node = gen.CssSelect("a").First();
                        ClearNode = node.InnerText;
                        ClearNode = ClearNode.Replace("\n", "").Replace("\r", "");
                        Elements.Add(ClearNode);
                        break;

                    default:
                        ClearNode = gen.InnerText;
                        ClearNode = ClearNode.Replace("\n", "").Replace("\r", "");
                        Elements.Add(ClearNode);
                        break;
                }
            }
            return Elements;
        }

        //Muestra todos los generos y subgeneros musicales de la pagina
        public IEnumerable<Genre> AllGenre()
        {
            HtmlWeb OWEB = new HtmlWeb();
            HtmlDocument Doc = OWEB.Load("https://us.napster.com/music");
            List<Genre> lstGeneres = new List<Genre>();
            foreach (var gen in Doc.DocumentNode.CssSelect(".genre-name-text"))
            {
                Genre genereObject = new Genre();
                genereObject.NameGenere = gen.InnerHtml;
                genereObject.NameGenere = genereObject.NameGenere.Replace("\n", "").Replace("\r", "");
                Doc = OWEB.Load(string.Concat("https://us.napster.com/genre/", genereObject.NameGenere));
                
                genereObject.NameGenere = genereObject.NameGenere;
                genereObject.lstSubGeneres = new List<SubGenre>();
                foreach (var subGen in Doc.DocumentNode.CssSelect(".tag-button"))
                {
                    genereObject.lstSubGeneres.Add(new SubGenre{NombreSubGenero = subGen.InnerHtml });
                }
                lstGeneres.Add(genereObject);
            }
            return lstGeneres;
        }

    }

    //entidades para poblar la información
    public class Artist
    {
        public string NameArtist { get; set; }
    }

    public class Album
    {
        public string NameAlbum { get; set; }
    }

    public class Tracks 
    {
        public string nameSong { get; set; }
    }


    public class SubGenre
    {
        public string NombreSubGenero { get; set; }
    }

    public class Genre
    {
        public string NameGenere { get; set; }        
        public List<SubGenre> lstSubGeneres;
    }


}