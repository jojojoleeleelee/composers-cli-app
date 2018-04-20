class Composers::Composer
  attr_accessor :name, :bio, :year, :works, :url, :input
  @@all = []

  def initialize(profile_hash)
    profile_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def display_composer
  end
end
