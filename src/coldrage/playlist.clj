(ns coldrage.playlist
  (:require [environ.core :refer [env]])
  (:require [clojure.string :as string])
  (:require [clj-http.client :as client])
  (:require [clojure.data.json :as json])
  (:import java.util.Base64))

(defn base64-encode
  [s]
  (. (. Base64 getEncoder) encodeToString (. s getBytes)))

(def authorization
  (base64-encode (string/join ":" [(env :client-id) (env :client-secret)])))

(def token-body
  (:body (client/post "https://accounts.spotify.com/api/token"
                      {:headers {"Authorization" (string/join " " ["Basic" authorization])}
                       :form-params {:grant_type "client_credentials"}
                       })))
(def token
 (:access_token (json/read-str token-body :key-fn keyword)))

(def vr
  "37i9dQZF1DWVF0pvJ1YrL7")

(defn pull-playlist
  [playlist-id]
  (client/get (string/join
                ""
                ["https://api.spotify.com/v1/playlists/" playlist-id "/tracks"])
              {:oauth-token token}))

(def vr-playlist
  (pull-playlist vr))
