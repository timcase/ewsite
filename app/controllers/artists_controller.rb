class ArtistsController < ApplicationController

  def find_similar
    @artists = Echowrap.artist_similar(:name => params[:artist_name], :bucket => ['artist_location', 'hotttnesss'])
    @artists = @artists.sort{|a, b| a.hotttnesss <=> b.hotttnesss}.reverse
  end

  def find_songs
    @songs = Echowrap.artist_songs(:name => params[:artist_name])
  end

  def find_images
    @images = Echowrap.artist_images(:name => params[:artist_name])
  end
end
