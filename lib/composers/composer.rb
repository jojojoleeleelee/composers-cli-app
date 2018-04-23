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

  def self.display_all
    @@display.each do |attr, content|
      puts "----------------------------------- #{attr} -------------------------------------"
      puts content
    end
  end
end
