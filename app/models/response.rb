class Response < ActiveRecord::Base
  attr_accessible :question_id, :kind, :value, :ip, :header
  belongs_to :question
  include ActionView::Helpers::DateHelper    
  def statsData
    {
      value: self.value,      
      kind: self.kind,
      id: self.id,
      ago: "#{time_ago_in_words(self.created_at)} ago"
    }
  end
end
