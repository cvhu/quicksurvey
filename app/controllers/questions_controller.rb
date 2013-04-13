class QuestionsController < ApplicationController
  
  def stats
    obj = {}
    if params[:token].nil?
      obj[:status] = 'fail'
      obj[:message] = 'question token required'
    else
      question = Question.find_by_token(params[:token])
      if question.nil?
        obj[:status] = 'fail'
        obj[:message] = 'invalid question token'
      else
        obj[:status] = 'success'
        obj[:data] = question.statsData
      end
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end  
  
  
  def answer
    obj = {}
    if params[:token].nil? or params[:value].nil?
      obj[:status] = 'fail'
      obj[:message] = 'question token and value required'
    else
      question = Question.find_by_token(params[:token])
      if question.nil?
        obj[:status] = 'fail'
        obj[:message] = 'invalid question token'
      else
        obj[:status] = 'success'
        obj[:message] = 'Thank you. Your response has been recorded'
        Response.create(:question_id => question.id, :value => params[:value], :kind => question.kind)
      end
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end
end
