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
        ip = request.remote_ip
        header = request.headers['HTTP_USER_AGENT'].to_s
        if Response.where(:header => header, :ip => ip).count > 0
          obj[:status] = 'fail'
          obj[:message] = 'Repeated answers are not allowed!'
        else          
          if question.kind=="multiple-choice"
            option = Option.find_by_token(params[:value])
            if option.nil?
              obj[:status] = 'fail'
              obj[:message] = 'invalid option token'
            else
              obj[:status] = 'success'
              obj[:message] = 'Thank you. Your response has been recorded'
              Response.create(:header => header, :ip => ip, :question_id => question.id, :value => params[:value], :kind => question.kind)
            end
          else
            obj[:status] = 'success'
            obj[:message] = 'Thank you. Your response has been recorded'
            Response.create(:header => header, :ip => ip, :question_id => question.id, :value => params[:value], :kind => question.kind)
          end
        end
      end
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end
end
