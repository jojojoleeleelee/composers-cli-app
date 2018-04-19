class Composers::CLI

  def call
    puts "Want to learn more about Composers?"
    start
  end

  def to_number
    number = self.tr("A-Z", "1-9a-q").to_i(27)
    number -= 1 if number > 27
    return number
  end

  def alphabet_selection
    chosen = input.to_number
  end

  def start
    input = nil
    while input != "exit" || input != "stop"
      puts ""
      puts "Type your favorite letter from the alphabet:"
      puts "C'mon it can't be that hard..."
      puts "You have exactly 27 choices!"
      puts "Enter exit to end"
      puts "Also, you're in for a fun surprise!"
      input = gets.strip.downcase[0]
      if input.is_a? String
        Composers::ComposersFunction.list_of_composers(input.to_number)
        puts "Now, choose the person you want to learn more about by typing the corresponding number of that composer."

      else
        start
      end
    end
    puts "Buh-Bye! Remember to listen to some Bach :)"
  end
end
