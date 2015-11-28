class AnswersController < ApplicationController
  
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
        
      if @answer.save
        redirect_to :back
      else
        flash[:alert] = "Enter your answer please."
        
        redirect_to :back
      end
    
  end

  private
  
    def answer_params
      params.require(:answer).permit(:body)
    end
end
