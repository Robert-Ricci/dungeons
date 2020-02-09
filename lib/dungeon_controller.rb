require 'pry'
class Dungeons::DungeonController


    attr_accessor :character

    # def initialize
    #     @character = character
    # end


    def welcome
        puts "Welcome Adventurers to my D&D CLI!"
        puts "For the menu type 'menu'"
        input = gets.strip
            if input == 'menu'
                self.menu
            else
                self.welcome
            end
        end

        def menu
            input = " "
        while input != "exit"
            puts " "
            puts "To enter your character's name type 'name'"
            #sleep 1
            puts " "
            puts "For Races type 'list races'"
            #sleep 1
            puts " "
            puts "For Classes type 'list classes'"
            #sleep 1
            puts " "
            puts "To quit type 'exit'"
            
            input = gets.strip

            case input

            when "list races"
                puts list_races
            when "list classes"
                puts list_klasses
            # when "name"
            #     puts save_name

            end
        end
    end


    # def save_name
    #     puts "Enter your character's name."
    #     input = gets.strip
        
    #     self.character = Dungeons::Character.create(input)

    # end

    def list_races
        counter = 0
        index = 0
        @race_hash = []
        @race_hash << Dungeons::API.new.race_call
        @race_hash.sort{|x, y| x <=> y}.each do |race|
            race["results"].each do |a|
            puts "#{counter +1}. #{a["name"]}"
            counter += 1
            end
        end
        self.race_info
    end

    def race_info
        input = " "
        puts "Which race would you like to hear more about?"
        input = gets.strip
        @info = []
        @info << Dungeons::API.new.race_info_call(input)
        @info.each do |z|
            puts "#{z["name"]}"
            puts "Speed: #{z["speed"]}"
            puts "Ability Bonus: #{z["ability_bonuses"][0]["name"]} + #{z["ability_bonuses"][0]["bonus"]}"
            puts " "
        end
        self.list_races
    end

    def list_klasses
        counter = 0
        index = 0
        @klass_hash = []
        @klass_hash << Dungeons::API.new.klass_call
        @klass_hash.sort{|x, y| x <=> y}.each do |klass|
            klass["results"].each do |a|
            puts "#{counter +1}. #{a["name"]}"
            counter += 1
            end
        end
        self.klass_info
    end
    
    def klass_info
        input = " "
        puts "Which class would you like to hear more about?"
        input = gets.strip
        @klass_info = []
        @klass_info << Dungeons::API.new.klass_info_call(input)
        @klass_info.each do |z|
            puts "#{z["name"]}"
            puts "Hit-Die: #{z["hit_die"]}"
            puts "Proficiency choices: #{z["proficiency_choices"][0]["choose"]}"
            puts " "
        end
        self.list_klasses
    end
    
        
        

   

end

