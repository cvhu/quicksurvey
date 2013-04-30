class PagesController < ApplicationController
  
  def newSurvey
  end
  
  def surveyTake
  end

  def surveyTakeToken    
  end
  
  def surveyPanel
    @survey = Survey.find_by_token(params[:token])
  end

   def surveyPanelRefresh
    @survey = Survey.find_by_token(params[:token])
  end
  
  def surveyPanelTest
    @survey = Survey.find_by_token(params[:token])
  end
end
