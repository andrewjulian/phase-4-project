class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    questions = Question.all
    render json: questions
  end

  def create
    user = User.find_by(id: session[:user_id])
    question = user.questions.create!(question_params)
    render json: question, status: :created
  end

  private

  def question_params
    params.permit(:id, :title, :details, :image_url, :open)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: ["Invalid Data"] }, status: :unprocessable_entity
  end
end