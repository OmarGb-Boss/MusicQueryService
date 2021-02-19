using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;


namespace MusicQueryService
{   
    //clase que contine  la logica del servicio 
    public class QueryMusic : IQueryMusic
    {
        WebScrapingResources _ws = new WebScrapingResources();
        DataManager _Dm = new DataManager();

        //Artista por genero
        public IEnumerable<Artist> ArtistByGenere(string Genre)
        {
            //envia cómo parámetro los criterios de busqueda para el web scraping
            var dc = _ws.utiliti("https://us.napster.com/search/artist?query=", Genre, ".name");
            List<Artist> lstArtist = new List<Artist>();
            foreach (var l in dc)
            {
                Artist a = new Artist
                {
                    NameArtist = l.ToString()
                };
                lstArtist.Add(a);
            }
            _Dm.InsertArtist(lstArtist, Genre);
            //retorna la lista de objetos
            return lstArtist;
        }

        //Album por artista
        public IEnumerable<Album> AlbumByArtist(string Artist)
        {
            var dc = _ws.utiliti("https://us.napster.com/search?query=", Artist, ".album-link");
            List<Album> lstAlbum = new List<Album>();
            foreach (var l in dc)
            {
                Album a = new Album
                {
                    NameAlbum = l.ToString()
                };
                lstAlbum.Add(a);
            }
            _Dm.InsertAlbum(lstAlbum, Artist);
            return lstAlbum;
        }

        //Canciones por album
        public IEnumerable<Tracks> SongsByAlbum(string Album)
        {
            var dc = _ws.utiliti("https://us.napster.com/search/track?query=", Album, ".name");
            List<Tracks> lstSongs = new List<Tracks>();
            foreach (var l in dc)
            {
                Tracks song = new Tracks
                {
                    nameSong = l.ToString()
                };
                lstSongs.Add(song);
            }
            _Dm.InsertSongs(lstSongs, Album);
            return lstSongs;
        }

        //artistas por canción
        public IEnumerable<Artist> ArtistBySong(string song)
        {
            var dc = _ws.utiliti("https://us.napster.com/search?query=", song, ".artist-link");
            List<Artist> lstArtist = new List<Artist>();
            foreach (var l in dc)
            {
                Artist artist = new Artist
                {
                    NameArtist = l.ToString()
                };
                lstArtist.Add(artist);
            }
            _Dm.InsertSoundtrack(lstArtist, song);
            return lstArtist;
        }
        //Todos los generos
        public IEnumerable<Genre> AllGenre()
        {            
            return _ws.AllGenre();
        }
    
    }
}
