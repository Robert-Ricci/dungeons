require 'pry'
class Dungeons::DungeonController


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
        counter = 0
        index = 0
        race_array = []
        race_array << Dungeons::API.new.race_call
        race_array.sort{|x, y| x <=> y}.each do |race|
            race["results"].each do |a|
            puts "#{counter +1}. #{a["name"]}"
            counter += 1
            end
        end
        self.race_select
        
    end

    def race_info(input)
        info = []
        info << Dungeons::API.new.race_info_call(input.downcase)
        info.each do |z|
            puts "#{z["name"]}"
            puts "Speed: #{z["speed"]}"
            puts "Ability Bonus: #{z["ability_bonuses"][0]["name"]} + #{z["ability_bonuses"][0]["bonus"]}"
            puts " "
            end
        self.list_races
    end

    def race_select
        input = " "
        puts "Which race would you like to hear more about?"
        puts "Type 'menu' for main menu. "
        input = gets.strip

        if input != 'menu'
            race_info(input)
        else 
            menu
        end

    end


    def list_klasses
        counter = 0
        index = 0
        klass_array = []
        klass_array << Dungeons::API.new.klass_call
        klass_array.sort{|x, y| x <=> y}.each do |klass|
            klass["results"].each do |a|
            puts "#{counter +1}. #{a["name"]}"
            counter += 1
            end
        end
        self.klass_select
    end
    
    def klass_info(input)
        # input = " "
        # puts "Which class would you like to hear more about?"
        # input = gets.strip
        klass_info = []
        klass_info << Dungeons::API.new.klass_info_call(input.downcase)
        klass_info.each do |z|
            puts "#{z["name"]}"
            puts "Hit-Die: #{z["hit_die"]}"
            puts "Proficiency choices: #{z["proficiency_choices"][0]["choose"]}"
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
            klass_info(input)
        else 
            menu
        end
    end
end

