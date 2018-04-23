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
       # can we put the `puts` statement into the CLI class somehow?
       puts "#{idx}. - #{name}"
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
    @@profile[:name] = doc.css('[id="center"]').css('h3').first.text
    @@profile[:bio] = doc.css('.composerbiocontainer').css('p').map do |p|
      p.text.strip!
    end
    @@profile[:year] = doc.css('h4').text
    @@profile[:works] = doc.css('.recommendedpiececontainer').css('dt').map do    |w| w.text.strip!
    end

    @@profile[:url] = @url
    # here's where we actually instantiate a new composer.  Could we do this without
    # a @@profile class variable?  I bet we can.  Maybe a variable that's a hash,
    # similar to @@profile, and call it `composer_attributes`  Then, when we could
    # call something along the lines of
    # current_composer = Composers::Composer.new(composer_attributes)
    # and keep track of this composer as we move through the flow...
    Composers::Composer.new(@@profile)
    @@profile
  end
end
