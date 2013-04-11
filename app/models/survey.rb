class Survey < ActiveRecord::Base
  attr_accessible :name, :title
  include Rails.application.routes.url_helpers  
  def self.getName
    list = [('a'..'z'),('0'..'9')].map{|i| i.to_a}.flatten
    return (0...4).map{list[rand(list.length)]}.join  
  end
  
  def self.getQRCodeURL
    return "https://chart.googleapis.com/chart?cht=qr&chs=150x150&chl=asdf"
  end
  
  def tiny
    {
      url: "/surveys/"
    }
  end
end
