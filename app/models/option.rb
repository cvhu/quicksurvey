class Option < ActiveRecord::Base
  attr_accessible :content, :question_id, :token, :kind
  belongs_to :question
  
  def self.getToken
    list = [('A'..'Z'),('a'..'z'),('0'..'9')].map{|i| i.to_a}.flatten
    token = (0...6).map{list[rand(list.length)]}.join 
    while(not Option.find_by_token(token).nil?)
      token = (0...6).map{list[rand(list.length)]}.join
    end
    return token
  end
  
  def askData
    {
      content: self.content,
      token: self.token,
      kind: self.kind
    }
  end
  
  def statsData
    {
      content: self.content,
      total: self.responseCount,
      kind: self.kind
    }
  end
  
  def responseCount
    self.question.responses.where(:value => self.token).count
  end
  
end
