class Backup < ApplicationRecord
  belongs_to :remote_entity, polymorphic: true
end
