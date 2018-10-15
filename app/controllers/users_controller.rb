class UsersController < ApplicationController
    def start
    end
  
    def index
      spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
      @tracks = []
      @names = []
      offset = 0
      count = 0
      while true
        results = spotify_user.saved_tracks(limit: 50, offset: offset)
        offset = offset + 50

        results.each_with_index do |item, index|
            count = count + 1
            @tracks << item.id
            @names << item.name
          end
          if (results.size < 50)
            break
          end
        end

        features = []
        number = @tracks.length
        offset = 0
        while true
          features.concat RSpotify::AudioFeatures.find(@tracks[0, 100])
          if(offset >= number)
            break
          end
          offset = offset + 100
        end

        @analysis = []
        features.each_with_index do |track, index|
          @analysis << [@names[index], (track.danceability + track.energy)/2]
        end

    end
end