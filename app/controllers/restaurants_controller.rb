class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.build
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant added successfully"
      redirect_to restaurant_path(@restaurant)
    elsif (validate_form_zip? == false && validate_form_state? == false && validate_form_city? == false
      validate_form_address? == false && validate_form_name? == false)
      flash[:notice] = "Name can't be blank"
      flash[:notice] += "Address can't be blank"
      flash[:notice] += "City can't be blank"
      flash[:notice] += "State can't be blank"
      flash[:notice] += "Zip can't be blank"
      render :new
    elsif validate_form_zip? == false
      flash[:notice] = "Zip can't be blank"
      render :new
    elsif validate_form_state? == false
      flash[:notice] = "State can't be blank"
      render :new
    elsif validate_form_city? == false
      flash[:notice] = "City can't be blank"
      render :new
    elsif validate_form_address? false
      flash[:notice] = "Address can't be blank"
      render :new
    elsif validate_form_name? == false
      flash[:notice] = "Name can't be blank"
      render :new
    end
  end



  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
  end

  def validate_form_name?
    if @restaurant.name == "" || @restaurant.name == nil
      return false
    else
      return true
    end
  end
  def validate_form_address?
    if @restaurant.address == "" || @restaurant.address == nil
      return false
    else
      return true
    end
  end
  def validate_form_city?
    if @restaurant.city == ""
      flash[:notice] = "City can't be blank"
      return false
    else
      return true
    end
  end
  def validate_form_state?
    if @restaurant.state == ""
      flash[:notice] = "State can't be blank"
      return false
    else
      return true
    end
  end
  def validate_form_zip?
    if @restaurant.zip == ""
      flash[:notice] = "Zip can't be blank"
      return false
    else
      return true
    end
  end

end
