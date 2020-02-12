class Dungeons::Klass

attr_accessor :name, :hit_die, :proficiency_choices, :_id, :index, :proficiencies, :saving_throws, :starting_equipment, :class_levels,
:subclasses,:spellcasting, :url


   
    @@all = []

    def initialize(attributes)
        @name = name
        attributes.each {|key, value| self.send(("#{key}="), value)}
        save
    end

    def save
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.get_klass_by_name(name)
        self.all.detect do |klass|
          klass.name == name
        end
    end
end
