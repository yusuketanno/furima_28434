class ItemsController < ApplicationController

  def new
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
