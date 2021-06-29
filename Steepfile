target :lib do
  signature "sig"

  check "app"

  repo_path "vendor/rbs/gem_rbs_collection/gems"

  library "pathname"
  library "logger"
  library "mutex_m"
  library "date"
  library "monitor"
  library "singleton"
  library "tsort"

  library "activesupport"
  library "actionpack"
  library "activejob"
  library "activemodel"
  library "actionview"
  library "activerecord"
  library "railties"

  ignore "app/models/watcher.rb"

  # library "pathname", "set"       # Standard libraries
  # library "strong_json"           # Gems
end

# target :spec do
#   signature "sig", "sig-private"
#
#   check "spec"
#
#   # library "pathname", "set"       # Standard libraries
#   # library "rspec"
# end
