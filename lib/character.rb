class Dungeons::Character

    attr_accessor :name, :race, :klass, :character
    @character = []
    @@all = []

    def initialize(race = nil, klass = nil)
        @race = race
        @klass = klass
        @character = character
        #attributes.each {|key, value| self.send(("#{key}="), value)}
        save
    end

    def save
        @@all << self 
    end

    # def self.create(name)
    #     @character = new(name)
    #     @character.save
    #     @character
    #   end

    #   def self.add_race(race)
    #     #@character << race 
    #     @character.save
    #     @character
    #   end



    def self.all
        @@all
    end

    
end

