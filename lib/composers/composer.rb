# You're right:  there is still an issue requiring
# the @@display class variable.  How could we refactor again to get rid of that?
# I'm inserting some comments below if you'd like to have a look
class Composers::Composer
  attr_accessor :name, :bio, :year, :works, :url, :input
  @@display = {}
  @@all = []

  def initialize(profile)
    profile.each {|key, value| self.send(("#{key}="), value)}
    profile.to_hash
    @@display = profile
    @@all << self
  end

  def to_hash
    hash = {}
    instance_variables.tap {|var| hash[var] = instance_variable_get(var) }
  end

  def self.all
    @@all
  end

# Question:  should `display_all` really be a class method?  Does it deal with
# displaying data from multiple instances of a composer, or just one?  If it's just
# one, it should probably be an instance method.  Maybe something like this:

# def display_all
  # with whatever text, line decorations, or labels you want
  # puts "---Name---"
  # puts self.name
  # puts "---Bio---"
  # puts self.bio
  # puts "---Year---"
  # puts self.year
  # puts "---Works---"
  # puts self.works
# end

# Now, this seems to introduce a problem... how to handle the instance of which
# composer you're working with when calling your #display_all method?
# Have look at some comments in the CLI class where this method is called
# And finally, could we somehow extract this logic so that we are only
# calling `puts` from within the CLI class?

  def self.display_all
    @@display.each do |attr, content|
      puts "----------------------------------- #{attr} -------------------------------------"
      puts content
    end
  end
end
