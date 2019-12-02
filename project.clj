(defproject coldrage "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[clj-http "3.10.0"]
                 [environ "1.1.0"]
                 [org.clojure/clojure "1.10.0"]
                 [org.clojure/data.json "0.2.7"]
                 [org.clojure/tools.cli "0.4.2"]]
  :plugins [[lein-environ "1.1.0"]]
  :main ^:skip-aot coldrage.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
