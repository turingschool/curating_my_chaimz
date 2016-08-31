class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(parms[:id])
  end

  def index
    @artists = Artist.all
  end

end
