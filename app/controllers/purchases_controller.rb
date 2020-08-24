class PurchasesController < ApplicationController

  
  def index
    @item = Item.find(params[:item_id])
    if request.referer.nil?
      redirect_to root_path
    end
  end



  private

  def item_params
    params.require(:item).permit(:image).merge(item_id: params[:item_id])
  end
end
