class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :playlist_track
end
