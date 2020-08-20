class ItemsController < ApplicationController
  
  

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def create
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end


end
