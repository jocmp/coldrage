import fetch from "node-fetch";

export default class Spotify {
  private token: string;

  constructor(token: string) {
    this.token = token;
  }

  async fetchPlaylist(playlistID: string): Promise<Playlist> {
    return (
      await fetch(`https://api.spotify.com/v1/playlists/${playlistID}`, {
        headers: {
          Authorization: `Bearer ${this.token}`
        }
      })
    ).json();
  }
}

export interface Playlist {
  id: string;
  name: string;
  tracks: Tracks;
}

export interface Artist {
  id: string;
  href: string;
  name: string;
  uri: string;
}

export interface Tracks {
  items: TrackItem[];
}

export interface TrackItem {
  added_at: string; // tz string
  track: Track;
}

export interface Track {
  id: string;
  album: Album;
  artists: Artist[];
  href: string;
  name: string;
  popularity: number;
  uri: string;
}

export interface Album {
  name: string;
}
