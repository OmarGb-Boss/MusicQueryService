using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace MusicQueryService
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IQueryMusic" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IQueryMusic
    {
        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Bare,
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "artistByGenre/{Genere}")]
        IEnumerable<Artist> ArtistByGenere(string Genere);

        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Bare,
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "albumByArtist/{Artist}")]
        IEnumerable<Album> AlbumByArtist(string Artist);

        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Bare,
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "songsByAlbum/{Album}")]
        IEnumerable<Tracks> SongsByAlbum(string Album);
        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Bare,
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "artistBySong/{song}")]
        IEnumerable<Artist> ArtistBySong(string song);


        [OperationContract]
        [WebGet(BodyStyle = WebMessageBodyStyle.Bare,
             RequestFormat = WebMessageFormat.Json,
             ResponseFormat = WebMessageFormat.Json,
             UriTemplate = "allGenre")]
        IEnumerable<Genre> AllGenre();

    }
}
