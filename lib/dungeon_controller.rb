require 'pry'
class Dungeons::DungeonController


    def welcome
        input = " "
        while input != "exit"
            puts "Welcome Adventurers to my D&D CLI!"
            sleep 1
            puts " "
            puts "For Races type 'list races'"
            sleep 1
            puts " "
            puts "For Classes type 'list classes'"
            sleep 1
            puts " "
            puts "To quit type 'exit'"
            
            input = gets.strip

            case input

            when "list races"
                puts list_races
            when "list classes"
                puts list_classes
            end
        end
    end

    def list_races
        counter = 0
        index = 0
        @race_hash = []
        @race_hash << Dungeons::API.new.api_call
        @race_hash.sort{|x, y| x.name <=> y.name}.each do |race|
            puts "#{counter +1}. #{race["results"][index]["name"]}"
            counter += 1
            index += 1
            binding.pry
        end
     end

    # def list_classes

    # end

end

