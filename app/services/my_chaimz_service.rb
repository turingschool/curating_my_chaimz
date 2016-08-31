class MyChaimzService

  def initialize
    @connection = Faraday.new("http://my-chaimz.herokuapp.com/api/v1/")
    @connection.headers["Authorization"]  = "Bearer 35148ad62db32ff044d6df2cd57"
  end

  def get_artists
    response = @connection.get "artists"
    parse( response.body )
  end

  def get_artist(id)
    # response = @connection.get "artists/#{id}"
    # parse ( response.body )
    response = @connection.get do |req|
      req.url "artists/#{id}"
      req.params['key'] = "value"
    end

    parse( response.body )
  end

  def create_artist(artists_hash)
    response = @connection.post( "artists?name=#{artists_hash['name']}" )
    parse ( response.body )
  end

  private

  def parse(response)
    JSON.parse( response, symbolize_names: true )
  end
end
