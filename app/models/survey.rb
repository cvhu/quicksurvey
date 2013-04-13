class Survey < ActiveRecord::Base
  attr_accessible :token, :title  
  include Rails.application.routes.url_helpers  
  def self.getToken
    list = [('a'..'z'),('0'..'9')].map{|i| i.to_a}.flatten
    token = (0...4).map{list[rand(list.length)]}.join 
    while(not Survey.find_by_token(token).nil?)
      token = (0...4).map{list[rand(list.length)]}.join
    end
    return token
  end
  
  def self.getQRCodeURL
    return "https://chart.googleapis.com/chart?cht=qr&chs=150x150&chl=asdf"
  end
  
end
