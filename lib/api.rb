class Dungeons::API

    require 'httparty'


    def race_call
        url = 'http://www.dnd5eapi.co/api/races'
        response = HTTParty.get(url)
        response.parsed_response
    end

    def race_info_call(input)
        url = 'http://www.dnd5eapi.co/api/races'
        response = HTTParty.get(url + "/#{input}")
        response.parsed_response
    end
    
    def klass_call
        url = 'http://www.dnd5eapi.co/api/classes'
        response = HTTParty.get(url)
        response.parsed_response
    end

    def klass_info_call(input)
        url = 'http://www.dnd5eapi.co/api/classes'
        response = HTTParty.get(url + "/#{input}")
        response.parsed_response
    end
end
