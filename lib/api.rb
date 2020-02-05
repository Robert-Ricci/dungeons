class Dungeons::Api

    require 'httparty'


    def api_call
        binding.pry
        url = 'http://www.dnd5eapi.co/api/races'
        response = HTTParty.get(url)
        response.parsed_response
    end

end
