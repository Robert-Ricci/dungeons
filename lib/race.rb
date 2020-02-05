class Dungeons::Race

    attr_accessor :name, :ability_bonus, :speed

    @@all = []

    def initialize(race_hash)
        @name = name
        @ability_bonus = ability_bonus 
        @speed = speed 
        race_hash.each {|key, value| self.send(("#{key}="), value)}
        @@all << self 
    end

   

    def self.all
        @@all
    end

    
end

