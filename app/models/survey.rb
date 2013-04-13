class Survey < ActiveRecord::Base
  attr_accessible :token, :title      
  has_many :questions, :dependent => :destroy
  
  def self.getToken
    list = [('a'..'z'),('0'..'9')].map{|i| i.to_a}.flatten
    token = (0...4).map{list[rand(list.length)]}.join 
    while(not Survey.find_by_token(token).nil?)
      token = (0...4).map{list[rand(list.length)]}.join
    end
    return token
  end
  
  def askData
    {
      title: self.title,
      token: self.token,
      questions: self.questions.map{|q| q.askData}
    }
  end
  
  def statsData
    {
      title: self.title,
      token: self.token,
      questions: self.questions.map{|q| q.statsData}
    }
  end
    
end
