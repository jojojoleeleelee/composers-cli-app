class Composers::Classical
  def call
    puts "Want to learn more about Composers?"
    list_composers
  end

  def menu
    puts "Type your favorite letter from the alphabet:"
    input = nil
    while input != 'exit'
    input = gets.strip.downcase[0]
  end
end
