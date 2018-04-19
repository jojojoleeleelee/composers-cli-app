
class Composers::ComposersFunction
  attr_accessor :name, :bio, :year, :works, :url

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end


  def self.list_of_composers(input)
    html = open("http://www.classical.net/music/composer/masterindex.php")
    scrape = Nokogiri::HTML(html)
    collection = Array.new
    i = 0
    while i < scrape.css('.worklist')[input-1].css('li').length
      collection << scrape.css('.worklist')[input-1].css('li').css('a')[i].children.text
      i += 1
    end

    collection.each.with_index(1) do |name, idx|
      puts "#{idx}. - #{name}"
    end
  end

  def self.profile_url
    html = open("http://www.classical.net/music/composer/masterindex.php")
    scrape = Nokogiri::HTML(html)
    binding.pry

    scrape.css('.worklist')[0].xpath('a')[0].attr('href').value
  end

  def self.composer_profile(profile_url)


  end
end
