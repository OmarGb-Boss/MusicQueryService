using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MusicQueryService.DataSorange;

namespace MusicQueryService
{
    //Está clase genera la inserción de datos, como historial de búsqueda
    //sus métodos reciben como parámetro listas de información obtenidas del web scraping
    public class DataManager
    {

        dbInfoMusicEntities1 Context = new dbInfoMusicEntities1();
        DateTime thisDay = DateTime.Today;
        //Artista por genero
        public bool InsertArtist(List<Artist> artist, string genero)
        {
            bool result = false;
            if (artist != null)
            {
                try
                {
                    foreach (var a in artist)
                    {
                        Artista artistObject = new Artista
                        {
                            NombreArtista = a.NameArtist,
                            GeneroMusical = genero,
                            FechaInsert = Convert.ToDateTime(thisDay.ToShortDateString())
                        };
                        Context.Entry(artistObject).State = System.Data.Entity.EntityState.Added;
                        Context.SaveChanges();
                    }

                    result = true;
                }
                catch
                {
                    result = false;
                }
            }
            else
            {
                result = false;
            }

            return result;
        }

        //Album por artista
        public bool InsertAlbum(List<Album> album, string artista)
        {
            bool result = false;
            if (album != null)
            {
                try
                {
                    foreach (var a in album)
                    {
                        AlbumMusical albumMusical = new AlbumMusical
                        {
                            NombreAlbum = a.NameAlbum,
                            NombreArtista = artista,
                            FechaInsert = Convert.ToDateTime(thisDay.ToShortDateString())
                        };
                        Context.Entry(albumMusical).State = System.Data.Entity.EntityState.Added;
                        Context.SaveChanges();
                    }
                    result = true;
                }
                catch(Exception e)
                {
                    result = false;
                }

            }
            else
            {
                result = false;
            }
            return result;
        }

        //Canciones por album
        public bool InsertSongs(List<Tracks> track, string album)
        {

            bool result = false;
            if (album != null)
            {
                try
                {
                    foreach (var t in track)
                    {
                        Songs songs = new Songs
                        {
                            NombreSong = t.nameSong,
                            NombreAlbum = album,
                            FechaInsert = Convert.ToDateTime(thisDay.ToShortDateString())
                        };
                        Context.Entry(songs).State = System.Data.Entity.EntityState.Added;
                        Context.SaveChanges();
                    }
                    result = true;
                }
                catch
                {
                    result = false;
                }
            }
            else
            {
                result = false;
            }

            return result;
        }

        //artistas por cancion
        public bool InsertSoundtrack(List<Artist> artista, string song)
        {
            
            bool result = false;

            if (artista != null)
            {
                try
                {
                    foreach (var a in artista)
                    {
                        SoundtrackArtist songs = new SoundtrackArtist
                        {
                            NameArtist = a.NameArtist,
                            Soundtrack = song,
                            FechaInsert = Convert.ToDateTime(thisDay.ToShortDateString())
                        };
                        Context.Entry(songs).State = System.Data.Entity.EntityState.Added;
                        Context.SaveChanges();
                    }

                    result = true;
                }
                catch
                {
                    result = false;
                }
            }
            else
            {
                result = false;
            }             
            return result;
        }

    }
}