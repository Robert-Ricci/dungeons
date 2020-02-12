require 'pry'
class Dungeons::DungeonController

    attr_accessor :character
    
    def welcome
        puts "Welcome Adventurers to my D&D CLI!"
        puts "For the menu type 'menu'"
        input = gets.strip
            if input == 'menu'
                self.menu
            else
                puts " "
                puts "Invalid entry,please enter proper response."
                self.welcome
            end
        end

        def menu
            input = " "
        while input != "exit"
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
            when "exit"
                exit
            end
        end
    end


    def list_races
        response = Dungeons::API.new.race_call
        response["results"].each_with_index do |race, value| 
            puts "#{value + 1}.#{race['name']}"
        end
        self.race_select
    end

    def get_race(input)
        if Dungeons::Race.get_race_by_name(input)
            self.character = Dungeons::Race.get_race_by_name(input)
          else
            response = Dungeons::API.new.race_info_call(input)
            
            if !response["error"]
              self.character = Dungeons::Race.new(response)
            else
              self.error_message
              self.list_races
            end
          end
        self.race_info
    end

    def race_info
            #Dungeons::Race.all.each do |race|
            puts "-------------------------" 
            puts "#{character.name}"
            puts "Speed: #{character.speed}"
            puts "Ability Bonus: #{character.ability_bonuses[0]["name"]} + #{character.ability_bonuses[0]["bonus"]}"
            puts "Size:#{character.size}"
            puts " "
       end
            self.list_races
    end

    def race_select
        input = " "
        puts "Which race would you like to hear more about?"
        puts "Type 'menu' for main menu. "
        input = gets.strip

        if input != "menu"
            self.get_race(input.downcase)
        elsif 
            self.menu
       end

    end


    def list_klasses
        response = Dungeons::API.new.klass_call
        response["results"].each_with_index do |race, value| 
            puts "#{value + 1}.#{race['name']}"
        end
        self.klass_select
    end
    
    def get_klass(input)
        if Dungeons::Klass.get_klass_by_name(input)
            self.character = Dungeons::Klass.get_klass_by_name(input)
          else
            response = Dungeons::API.new.klass_info_call(input)
            if !response["error"]
              self.character = Dungeons::Klass.new(response)
            else
              self.error_message
              self.list_klasses
            end
          end
        self.klass_info(input)
    end

    def klass_info(input)
        Dungeons::Klass.all.each do |klass|
            puts "-------------------------"
            puts "#{klass.name}"
            puts "Hit-Die: #{klass.hit_die}"
            puts "Proficiency choices: #{klass.proficiency_choices[0]["choose"]}"
            puts "Proficiency choices: #{klass.proficiency_choices[0]["choose"]}"
            puts "Saving Throws: #{klass.saving_throws[0]["name"]} + #{klass.saving_throws[1]["name"]}"
            puts "Subclasses: #{klass.subclasses[0]["name"]}"
            puts " "
        end
        self.list_klasses
    end
    
    def klass_select
        input = " "
        puts "Which class would you like to hear more about?"
        puts "Type 'menu' for main menu. "
        input = gets.strip

        if input != 'menu'
            get_klass(input.downcase)
        else 
            menu
        end
    end

    def error_message
        puts "Invalid entry, please try again."
    end

end

