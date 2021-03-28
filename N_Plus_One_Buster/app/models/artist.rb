# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query_includes
    # TODO: your code here
    tracks = self
      .albums
      .includes(:tracks)
    track_count = {}
    tracks.each do |album|
      track_count[album.title] = album.tracks.length
    end
    track_count
  end

  def better_tracks_query_joins
    # TODO: your code here
    albums = Album
      .select("albums.*, COUNT(*) AS track_count")
      .joins(:tracks)
      .group("albums.id")
      .where(['artist_id = ?', self.id])
    
    tracks = {}
    albums.each { |album| tracks[album.title] = album.track_count }

    tracks
  end
end
