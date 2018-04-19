
class Composers::ComposersFunction
  attr_accessor :name, :bio, :year, :works, :url

  def alphabet_selection
    # chosen = @input.to_number
  end

  def self.list_of_composers
    html = open("http://www.classical.net/music/composer/masterindex.php")
    scrape = Nokogiri::HTML(html)
    collection = Array.new
    # i = 0
    # while i < scrape.css('.worklist')["#{chosen}"].css('li').length
    #   collection << scrape.css('.worklist').css('li').css('a')[i].children.text
    #   i += 1
    # end

    collection.each.with_index(1) do |name, idx|
      puts "#{idx}. - #{name}"
    end
  end

  def self.profile_url
    html = open("http://www.classical.net/music/composer/masterindex.php")
    scrape = Nokogiri::HTML(html)

    scrape.css('.worklist').css('a')[0].attribute('href').value
  end

  def self.composer_profile(profile_url)


  end
end
