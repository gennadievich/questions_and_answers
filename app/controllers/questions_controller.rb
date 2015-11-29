class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions  = Question.all
    @categories = @questions.collect { |q| q.category }
    @categories.uniq!
  end

  def answered
    @questions  = Question.joins(:answers).where("answers.user_id = #{current_user.id}")
    @categories = @questions.collect { |q| q.category }
    @categories.uniq!
    
    render :index
  end
  
  def not_answered
    @answered_questions = Question.joins(:answers).where("answers.user_id = #{current_user.id}")
    @questions  = Question.all - @answered_questions
    @categories = @questions.collect { |q| q.category }
    @categories.uniq!
    
    render :index
  end
  
  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    
    redirect_to questions_path
  end

  private
  
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body, :category_id)
    end
  
end
