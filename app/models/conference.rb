class Conference < ActiveRecord::Base
  has_many :teams
  
  def self.update_from_espn
    confs_data = EspnXmlReader.get_conferences
    confs_data.each do |conf_data|
      conference = Conference.find_by_espn_id(conf_data[:conferenceId]) || Conference.new
      conference.update_attributes({
        :name => conf_data[:title],
        :short_name => conf_data[:conferenceAbbrev],
        :espn_id => conf_data[:conferenceId]
      })
    end
  end
end
