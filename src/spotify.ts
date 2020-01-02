import fetch from "node-fetch";

export default class Spotify {
  token: string;

  constructor(token: string) {
    this.token = token;
  }

  async playlist(playlistID: string) {
    return (
      await fetch(`https://api.spotify.com/v1/playlists/${playlistID}`, {
        headers: {
          Authorization: `Bearer ${this.token}`
        }
      })
    ).json();
  }
}
