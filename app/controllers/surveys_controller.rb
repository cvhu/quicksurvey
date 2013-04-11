class SurveysController < ApplicationController

  def create    
    obj = {}
    if params[:title].nil?
      obj[:status] = 'fail'
      obj[:message] = 'title of the survey is required'
    else
      obj[:status] = 'success'
      survey = Survey.create(:title => params[:title], :name => Survey.getName())
      obj[:data] = survey.tiny
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end
  
  def get    
    obj = {}
    if params[:name].nil?
      obj[:status] = 'fail'
      obj[:message] = 'name of the survey is required'
    else
      obj[:status] = 'success'
      obj[:data] = Survey.getQRCodeURL()
    end
    respond_to do |format|
      format.json {render :json => obj.to_json}
    end
  end
  
end
