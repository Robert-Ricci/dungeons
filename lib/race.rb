class Dungeons::Race

    attr_accessor :name, :ability
    @@all = []

    def initialize(race_hash)
        @name = name
        @ability = name 
        race_hash.each {|key, value| self.send(("#{key}="), value)}
        @@all << self 
    end

   

    def self.all
        @@all
    end

    
end

