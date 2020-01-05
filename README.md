## Coldrage

cold[ sto]rage - Fetch Spotify playlist tracklists and save to CSV

### Getting started

Coldrage is a Node.js app. To run:

1. Add Spotify credentials to `.env` file. See `.env.example` for more.
2. Install deps and run

```
npm install
npm run build-ts
npm start <spotify-playlist-id>
```

CSV is output to the `output/` directory, outside of version control.
