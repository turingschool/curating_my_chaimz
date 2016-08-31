class Artist < OpenStruct

  def self.service
    @@service ||= MyChaimzService.new
  end

  def self.all
    artists_hashes = service.get_artists

    artists_hashes.map do |artist_hash|
      Artist.new(artist_hash)
    end
  end

  def self.find(id)
    artist_hash = service.get_artist(id)
    Artist.new(artist_hash)
  end

  def self.create(artist_hash)
    new_artist_hash = service.create_artist(artist_hash)
    Artist.new(new_artist_hash)
  end
end
