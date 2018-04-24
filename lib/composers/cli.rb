class Composers::CLI
  attr_accessor :url, :input

  def call
    puts "********************** WANT TO LEARN MORE ABOUT COMPOSERS? *******************"
    start
  end

  def to_number(letter)
    number = letter.tr("A-Z", "1-9a-q").to_i(25)
    if number > 20
      number -= 1
    else
      number
    end
  end

  def start
    input = nil
     puts "******************** Type your favorite letter from the alphabet:************* "
     puts "******************** C'mon it can't be that hard...*************************** "
     puts "********* Actually, any letter but 'U'! You still have 25 choices! *********** "
     puts "********** Enter exit to end. Or not, if you're enjoying this :D ************* "
     input = gets.strip.upcase
     if input == 'EXIT'
       puts "Buh-Bye! Remember to listen to some Bach :))"
       exit!
     elsif input == "U"
       puts "******************************** HOW COULD YOU! ******************************"
       puts "********************************   Outrageous ********************************"
       puts "****************** I told you not to! You've betrayed me. ********************"
       puts ''
       puts ''
       puts "*************** I'm so nice, I'll still give you another try'. ***************"
       puts ''
       puts ''
       start
     elsif input.length == 1
       @input = to_number(input[0])
       Composers::Scraper.list_of_composers(@input)
       composer_choice
     elsif input.length > 1
       puts "Now, now, try that again."
       start
     end
   puts "Buh-Bye! Remember to listen to some Bach :)"
 end

  def composer_choice
    puts "Now, choose the person you want to learn more about by typing the corresponding number of that composer."
    num = gets.strip

   if num.to_i != 0 && num.to_i <= Composers::Scraper.collection.length
     Composers::Scraper.profile_url(@input, num)
     Composers::Scraper.composer_profile(@url)
     # Here is where we are calling the #display_all method.  How could we change
     # this if we were dealing with just an instance of a Composer.  We would want something like:
     # composer = Composer.new or Composer.last or something.. then we could just call
     # composer.display_all
     Composers::Composer.display_all
     puts "Wanna learn more about another composer?"
     start
   elsif num == 'exit'
     puts "Parting is such sweet sorrow that I shall say goodnight till it be morrow."
   else
     puts "Hmmm... can you enter that again?"
     composer_choice
   end
 end
end
