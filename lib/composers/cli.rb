class Composers::CLI
attr_accessor :input

  def call
    puts "Want to learn more about Composers?"
    menu
  end

  def menu
    puts "Type your favorite letter from the alphabet:"
    input = gets.strip.downcase[0]
    @input = input
  end

  def to_number
    number = self.tr("A-Z", "1-9a-q").to_i(27)
    number -= 1 if number > 27
    return number
  end

end
