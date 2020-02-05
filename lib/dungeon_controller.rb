class Dungeons::DungeonController


    def welcome
        input = " "
        while input != "exit"
            puts "Welcome Adventurers to my D&D CLI!"
            puts "For Races type 'list races'"
            puts "For Classes type 'list classes'"
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
        Dungeons::API{|x, y| x.name <=> y.name}.each do |race|
            puts "#{counter +1}. #{race.name}"
        end
    end

    def list_classes

    end

end

