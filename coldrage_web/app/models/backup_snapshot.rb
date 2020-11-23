# typed: strict
class BackupSnapshot < ApplicationRecord
  belongs_to :backup
end
