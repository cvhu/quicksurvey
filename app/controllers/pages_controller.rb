class PagesController < ApplicationController
  
  def newSurvey
  end
  
  def surveyPanel
    @survey = Survey.find_by_token(params[:token])
  end
end
