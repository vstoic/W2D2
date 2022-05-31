class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    def self.random_word
      DICTIONARY.sample
    end
    
      def initialize
          @secret_word = Hangman.random_word
          @guess_word = Array.new(@secret_word.length, "_")
          @attempted_chars = []
          @remaining_incorrect_guesses = 5
      end

      def guess_word
          @guess_word
      end

      def attempted_chars
          @attempted_chars
      end

      def remaining_incorrect_guesses
        @remaining_incorrect_guesses
      end

      def already_attempted?(char)
          if @attempted_chars.include?(char)
              return true
          elsif !@attempted_chars.include?(char)
              return false
          end
      end

      def get_matching_indices(char)
        array = []
          @secret_word.each_char.with_index {|e, i| array << i if e == char }
          array
      end

      def fill_indices(char, fill_array)
          fill_array.each {|i| @guess_word[i] = char}
      end


      # part 2 -----------------------------------


      def try_guess(char)
          if self.already_attempted?(char)
              print "that has already been attempted" 
              return false
          end

            @attempted_chars << char
            already_attempted?(char) == false

          if get_matching_indices(char) == []
                @remaining_incorrect_guesses -= 1 

              fill_indices(char, get_matching_indices(char))
          end
            
      end

      def ask_user_for_guess
        print "Enter a char"
        char = gets.chomp
        try_guess(char)
      end

      def win?
        if @guess_word == @secret_word
          print 'WIN'
          true
        else
          false
        end
      end

      def lose?
          if @remaining_incorrect_guesses == 0
          puts "LOSE"
            true
          else 
            false
          end
      end

      def game_over?
        if win?
          puts @secret_word
          true
        elsif lose?
          puts @secret_word
          true
        else
          false
        end
      end



end
