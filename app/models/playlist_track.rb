class PlaylistTrack < ApplicationRecord
  has_many :tracks
  has_many :playlists
end
