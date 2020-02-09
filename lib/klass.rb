class Dungeons::Klass

attr_accessor :name, :hit_die, :proficiency_choices
   
    @@all = []

    def initialize(attributes)
        @name = name
        @hit_die = hit_die
        @proficiency_choices = proficiency_choices
        attributes.each {|key, value| self.send(("#{key}="), value)}
        save
    end

    def save
        @@all << self 
    end

    def self.all
        @@all
    end

end
