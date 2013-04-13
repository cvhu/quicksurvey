class Response < ActiveRecord::Base
  attr_accessible :question_id, :kind, :value
  belongs_to :question
end
