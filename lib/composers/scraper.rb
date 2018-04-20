require_relative 'composer.rb'

class Composers::Scraper
  attr_accessor :url, :composer
  @@profile = {}

  def self.list_of_composers(input)
    html = open("http://www.classical.net/music/composer/masterindex.php")
     scrape = Nokogiri::HTML(html)
     @@collection = Array.new
     i = 0
     while i < scrape.css('.worklist')[input-1].css('li').length
       @@collection << scrape.css('.worklist')[input-1].css('li').css('a')[i].children.text
       i += 1
     end
     @@collection.each.with_index(1) do |name, idx|
       puts "#{idx}. - #{name}"
       @@profile[:name] = name
     end
  end

  def self.collection
    @@collection
  end

  def self.profile_url(input, num)
    html = open("http://www.classical.net/music/composer/masterindex.php")
    scrape = Nokogiri::HTML(html)
    url = scrape.css('.worklist')[input-1].css('a')[num.to_i-1].attribute('href').value.gsub("..","http://www.classical.net/music")
    @url = url
  end

  def self.composer_profile(url)
    doc = Nokogiri::HTML(open(@url))
    @@profile[:bio] = doc.css('.composerbiocontainer').css('p').map do |p|
      p.text.strip!
    end
    @@profile[:year] = doc.css('h4').text
    @@profile[:works] = doc.css('.recommendedpiececontainer').css('dt').map do    |w| w.text.strip!
    end

    @@profile[:url] = @url
    Composers::Composer.new(@@profile)
    @@profile
  end
end
