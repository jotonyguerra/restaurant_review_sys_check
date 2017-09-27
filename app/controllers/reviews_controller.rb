class ReviewsController < ApplicationController

  def index
    redirect_to 'reviews#new'
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    render 'restaurants/reviews/new'
  end

  def create
    @restaurant = Restaurant.find(review_params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "Body can't be blank"
      flash[:notice] += " Rating can't be blank"
      render 'restaurants/reviews/new'
    end
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(review_params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def valid_body?
    if @review.body == ""|| @review.body.nil?
      return false
    else
      return true
    end
  end

  def valid_rating?
    if @review.rating == "" || @review.rating.nil?
      return false
    else
      return true
    end
  end

  def review_params
    params.require(:review).permit(:rating, :body, :restaurant_id, :created_at, :updated_at)
  end
end
