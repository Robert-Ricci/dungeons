class Dungeons::Race

    attr_accessor :_id, :index, :name, :speed, :ability_bonuses, :age, :alignment, :size, :size_description, :starting_proficiencies,
    :languages, :language_desc, :traits, :subraces, :url, :starting_proficiency_options, :language_options, :ability_bonus_options,
    :trait_options, :error
   
    @@all = []

    def initialize(response)
        @name = name
        response.each {|key, value| self.send(("#{key}="), value)}
        save
    end

    def save
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.get_race_by_name(name)
        self.all.detect do |race|
          race.name == name
        end
    end

    
end

