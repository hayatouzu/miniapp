class ReviewsController < ApplicationController
  before_action :review_params, only: [:update]

  def index
    @reviews = Review.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy if review.user_id == current_user.id
    redirect_to action: :index
  end

  def update
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.update(review_params)
    end
    redirect_to action: :index
  end

  def create
    Review.create(review_params)
    redirect_to action: :index
  end

  private
    def review_params
      params.permit(:text).merge(user_id: current_user.id)
    end
  end

