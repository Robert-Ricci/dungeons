require 'pry'
class Dungeons::DungeonController


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
            puts "For Races type 'list races'"
            #sleep 1
            puts " "
            puts "For Classes type 'list classes'"
            #sleep 1
            puts " "
            puts "Type 'race info' plus the race to get more info"
            #sleep 1
            puts " "
            puts "To quit type 'exit'"
            
            input = gets.strip

            case input

            when "list races"
                puts list_races
            when "list classes"
                puts list_classes
            when "race info"
                puts race_info
            end
        end
    end

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
        self.choose_race
    end

    def list_classes
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
        self.choose_klass
    end
    
    

    # def race_info
    #   puts @race_hash  
    #   #binding.pry
    # end

    def choose_race
        puts " "
        puts "Choose a race for your adventure"
        input = gets.strip
     end

     def choose_klass
        puts " "
        puts "Choose a class for your adventure"
        input = gets.strip
     end

end

