class Hangman 

    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
        @correct_guessed = []
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
          end

    end

    def words
        [
            ["cricket", "Un juego jugdo por un caballero!"],
            ["jogging", "Nosotros no estamos caminando"],
            ["celebrate", "Recuerdando momentos especiales"],
            ["continent", "Tenemps 7 de estos en el planeta "],
            ["exotic", "Nada de esto por aquí"]
        ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?     
        puts @word_teaser
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split
        new_teaser.each_with_index do |letter, index|
            if letter == "_" && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end
        @word_teaser = new_teaser.join(' ')
    end

    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp

           

            good_guess = @word.first.include? guess
            if guess == "exit"
                puts "thank you for playing!"
            elsif(good_guess)
                puts "You are correct..."

                @correct_guessed << guess
                #remove correct letter form alpphabet 
                @letters.delete guess


                print_teaser guess
                make_guess
            else
                @lives -= 1
                puts "Sorry, you have #{@lives} left. try again"
                make_guess
            end
        else
            puts "Sorry  GAME OVER"
        end
    
    end

    def begin
        #todo a begin the game
        puts "New game started... your word is:  #{@word.first.size} characters long" 
        puts "to Exit to a program please puts Exit"
        
        print_teaser

        puts "Your clue is #{@word.last}"

        make_guess
       
    end
end


game = Hangman.new

game.begin
