import ClientOAuth from "client-oauth2";
import dotenv from "dotenv";
import { DateTime } from "luxon";
import Spotify from "./spotify";

dotenv.config();

async function token(): Promise<string> {
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

async function playlist(playlistID: string) {
  const s = await spotify();
  return await s.playlist(playlistID);
}

async function main() {
  const playlistID = "37i9dQZF1DXbtuVQL4zoey";
  console.log(
    `${playlistID}-${DateTime.local().toISO({ includeOffset: false })}.csv`
  );
  console.log(await playlist(playlistID));
}

main();
