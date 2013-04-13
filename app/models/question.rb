class Question < ActiveRecord::Base
  attr_accessible :survey_id, :title, :token, :kind
  belongs_to :survey
  has_many :options, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  
  def self.getToken
    list = [('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
    token = (0...5).map{list[rand(list.length)]}.join 
    while(not Question.find_by_token(token).nil?)
      token = (0...5).map{list[rand(list.length)]}.join
    end
    return token
  end
  
  def askData
    {
      title: self.title,
      token: self.token,
      kind: self.kind,
      options: self.options.map{|o| o.askData}
    }
  end
  
  def statsData
    {
      title: self.title,
      token: self.token,
      kind: self.kind,
      stats: {
        total: self.responses.count,
        options: self.options.map{|o| o.statsData}
      }
    }
  end
  
end
