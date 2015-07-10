class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @list = List.find(params[:list_id])
    @question = @list.questions.create(question_params)
    redirect_to list_path(@list)
  end

  def edit
  end

  def show
  end

  private
    def question_params
      params.require(:question).permit(:title)
    end
end
