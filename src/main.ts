import ClientOAuth from "client-oauth2";
import dotenv from "dotenv";
import * as csv from "@fast-csv/format";
import { DateTime } from "luxon";
import * as path from "path";
import { first } from "underscore";
import Spotify, { Playlist } from "./spotify";

dotenv.config();

async function token() {
  const auth = new ClientOAuth({
    clientId: process.env.CLIENT_ID,
    clientSecret: process.env.CLIENT_SECRET,
    accessTokenUri: "https://accounts.spotify.com/api/token"
  });

  return (await auth.credentials.getToken()).data.access_token;
}

async function spotify() {
  return new Spotify(await token());
}

async function fetchPlaylist(playlistID: string) {
  return await (await spotify()).fetchPlaylist(playlistID);
}

function playlistFilename({ name, id }: Playlist) {
  const timestamp = DateTime.local().toISO({ includeOffset: false });
  const playlistName = name.replace(/ /, "_");
  return `../output/${timestamp}_${id}_${playlistName}.csv`;
}

function formatCSV(playlist: Playlist) {
  const rows = playlist.tracks.items.map(trackItem => ({
    Track: trackItem.track.name,
    Artist: first(trackItem.track.artists)?.name,
    Album: trackItem.track.album.name,
    Added: trackItem.added_at,
    Popularity: trackItem.track.popularity
  }));
  csv.writeToPath(path.resolve(__dirname, playlistFilename(playlist)), rows, {
    headers: true
  });
}

async function main() {
  const playlistID = process.argv[2];
  formatCSV(await fetchPlaylist(playlistID));
}

main();
