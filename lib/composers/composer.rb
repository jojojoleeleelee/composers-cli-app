class Composers::Composer
  attr_accessor :name, :bio, :year, :works, :url, :input
  @@all = {}

  def initialize(profile)
    profile.map {|key, value| self.send(("#{key}="), value)}
    profile.to_hash
    @@all = profile
  end

  def to_hash
    hash = {}
    instance_variables.tap {|var| hash[var] = instance_variable_get(var) }
  end

  def self.all
    @@all
  end

  def self.display_all
    all.each do |attr, content|
      puts "----------------------------------- #{attr} -------------------------------------"
      puts content
    end
  end
end
