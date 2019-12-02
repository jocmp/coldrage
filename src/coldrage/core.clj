(ns coldrage.core
  (:require [coldrage.playlist :as playlist])
  (:require [clojure.tools.cli :refer [parse-opts]])
  (:gen-class))

(def cli-options
  [["-p" "--playlist PLAYLIST_ID" ""
    :required true]])

(defn -main
  [& args]
  (println playlist/vr-playlist))
