class Composers::CLI
  attr_accessor :name, :bio, :year, :works, :url
@@all = []
  # def initialize(profile_hash)
  #   profile_hash.each {|key, value| self.send(("#{key}="), value)}
  #   @@all << self
  # end

  def call
    puts "********************** WANT TO LEARN MORE ABOUT COMPOSERS? *****************"
    start
  end

  def to_number(letter)
    number = letter.tr("A-Z", "1-9a-q").to_i(27)
    number -= 1 if number > 27
    return number
  end

  def start
    input = nil
   while input != "exit"
     puts "********************* Type your favorite letter from the alphabet:********** "
     puts "********************* C'mon it can't be that hard...************************ "
     puts "********************* You have exactly 26 choices!************************** "
     puts "********************* Enter exit to end. Or not, if you're enjoying this! ** "
     puts "********************* You're in for a fun surprise!************************* "
     input = gets.strip
     if input.upcase[0].is_a? String
       Composers::ComposersFunction.list_of_composers(to_number(input.upcase[0]))
       puts "Now, choose the person you want to learn more about by typing the corresponding number of that composer."
       input = gets.strip
       input = "exit"
     else
       start
     end
   end
   puts "Buh-Bye! Remember to listen to some Bach :)"
 end
end
