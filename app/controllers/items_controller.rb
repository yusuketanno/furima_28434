class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit]
  before_action :sets_item, only: [:update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(item)
    else
      render :edit
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

  def set_item
    @item = Item.find(params[:id])
  end
  
  def sets_item
    item = Item.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end


end
