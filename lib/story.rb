require 'digest'

class Story
  attr_reader :data
  
  def initialize(hash = {})
    @data = hash
  end
  
  def title
    @data['summary']
  end
  
  def id
    @data['key']
  end
  
  def description
    @data['description']
  end
  
  def type
    @data['type']
  end
  
  def story_points
    custom_field('Story Points').to_i
  end
  
  def business_value
    (custom_field('Business Value') || @data['timeoriginalestimate'].split.first).to_i * 100 rescue 0
  end
  
  def roi
    unless business_value == 0 or story_points == 0
      (business_value.to_f / story_points.to_f).to_i
    else
      0
    end
  end
  
  def to_s
    "Story(id: #{id}, title: #{title}, story_points: #{story_points}, business_value: #{business_value}, roi: #{roi})"
  end
  
  def hash
    Digest::SHA256.hexdigest([title, description, id, type, story_points, business_value].map(&:to_s).join)
  end
  
  private
  def custom_field(key)
    @data['customfields']['customfield'].select{|f| f['customfieldname'] == key}.first['customfieldvalues']['customfieldvalue']
  rescue
    nil
  end
end