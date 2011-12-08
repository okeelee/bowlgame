class EspnXmlReader
  require 'net/http'
  require 'nokogiri'
  
  ESPN_NCF_URL = "http://feeds.espn.go.com/ncf/widgets/s"
  
  # standings feed
  # http://feeds.espn.go.com/ncf/widgets/s?c=standings&a=feed
  
  # division list
  # http://feeds.espn.go.com/ncf/widgets/s?c=divisions&a=list
  
  # conference list
  # http://feeds.espn.go.com/ncf/widgets/s?c=conferences&a=list
  
  # pac 12 feed
  # http://feeds.espn.go.com/ncf/widgets/s?c=standings&a=feed&group_id=9
  
  # team feed
  # http://feeds.espn.go.com/ncf/widgets/s?c=teams&a=feed&team_id=264
  
  # team game feed
  # http://feeds.espn.go.com/ncf/widgets/s?c=games&a=feed&team_id=264
  
  # get conferences
  def self.get_conferences
    self.get_ncf_data({:c=>"conferences", :a=>"list"})
  end
  
  # get conference teams
  def self.conference_teams conference_espn_id
    self.get_ncf_data({:c=>"standings", :a=>"feed", :group_id=>conference_espn_id})
  end
  
  # get team news
  def self.team_news team_espn_id
    self.get_ncf_data({:c=>"teams", :a=>"feed", :team_id=>team_espn_id})
  end
  
  # returns an array of the data you look for
  def self.get_ncf_data options = {}
    url = "#{ESPN_NCF_URL}?#{options.collect{|k,v|"#{k}=#{v}"}*"&"}"
    espn_xml = Nokogiri::XML(::Net::HTTP.get(URI.parse(url)).gsub(/\n/,'').gsub(/\t/,''))
    espn_array = []
    espn_xml.xpath('//item').each do |item|
      espn_hash = {}
      item.children.each do |attribute|
        espn_hash[attribute.name.to_sym] = attribute.content
      end
      espn_array << espn_hash
    end
    espn_array
  end
end