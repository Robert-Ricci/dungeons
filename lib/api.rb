class Dungeons::Api

    require 'httparty'


    def api_call
        url = 'http://www.dnd5eapi.co/api/'
        response = HTTParty.get(url)
        response.parsed_response
    end

end
