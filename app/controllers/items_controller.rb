class ItemsController < ApplicationController
  
  

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def create
    @item = Item.create!(item_params)
    redirect_to "/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    unless item.update(item_params)
      redirect_to edit_item_path
    else
      redirect_to items_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    unless item.destroy
      redirect_to item_path
    else
      redirect_to items_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :item_status_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :price)
    .merge(user_id: current_user.id)
  end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end


end
