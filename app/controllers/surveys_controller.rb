class SurveysController < ApplicationController

  def create    
    obj = {}
    if params[:title].nil?
      obj[:status] = 'fail'
      obj[:message] = 'title of the survey is required'
    else
      obj[:status] = 'success'
      survey = Survey.create(:title => params[:title], :token => Survey.getToken())
      obj[:data] = {
        token: survey.token
      }
      unless params[:questions].nil?
        params[:questions].each do |i, q|
          question = Question.create(:title => q[:title], :kind => q[:type], :survey_id => survey.id, :token => Question.getToken())
          unless q[:options].nil?
            q[:options].each do |j, o|
              option = Option.create(:content => o[:content], :kind => o[:type], :token => Option.getToken(), :question_id => question.id)
            end
          end
        end
      end
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end

  def panel
    obj = {}
    if params[:token].nil?
      obj[:status] = 'fail'
      obj[:message] = 'survey token required'
    else
      survey = Survey.find_by_token(params[:token])
      if survey.nil?
        obj[:status] = 'fail'
        obj[:message] = 'invalid survey token'
      else
        obj[:status] = 'success'
        obj[:data] = survey.statsData
      end
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end  
  
  def ask
    obj = {}
    if params[:token].nil?
      obj[:status] = 'fail'
      obj[:message] = 'survey token required'
    else
      survey = Survey.find_by_token(params[:token])
      if survey.nil?
        obj[:status] = 'fail'
        obj[:message] = 'invalid survey token'
      else
        obj[:status] = 'success'
        obj[:data] = survey.askData()
      end
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end
  
end
