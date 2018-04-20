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
   while input != "exit"
     puts "******************** Type your favorite letter from the alphabet:************* "
     puts "******************** C'mon it can't be that hard...*************************** "
     puts "********* Actually, any letter but 'U'! You still have 25 choices! *********** "
     puts "********** Enter exit to end. Or not, if you're enjoying this :D ************* "
     input = gets.strip.upcase[0]
     if input == "U"
       puts "******************************** HOW COULD YOU! ******************************"
       puts "********************************   Outrageous ********************************"
       puts "****************** I told you not to! You've betrayed me. ********************"
       puts ''
       puts ''
       puts "*************** I'm so nice, I'll still give you another try'. ***************"
       puts ''
       puts ''
     elsif input.is_a? String
       @input = to_number(input)
       Composers::ComposersFunction.list_of_composers(@input)
       composer_choice
     else
       start
     end
   end
   puts "Buh-Bye! Remember to listen to some Bach :)"
 end

  def composer_choice
    puts "Now, choose the person you want to learn more about by typing the corresponding number of that composer."
    num = gets.strip

   if num.to_i <= Composers::ComposersFunction.collection.length
     Composers::ComposersFunction.profile_url(@input, num)
     Composers::ComposersFunction.composer_profile(@url)

   else
     puts "Hmmm... can you enter that again?"
     composer_choice
   end
 end
end
