class PurchasesController < ApplicationController

  
  def index
    @item = Item.find(params[:item_id])
    if request.referer.nil?
      redirect_to root_path
    end
    @address = AddressPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address = AddressPurchase.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to items_path
    else
      render 'index'
    end
  end



  private

  def item_params
    params.require(:item).permit(:image).merge(item_id: params[:item_id])
  end

  def address_params
    params.require(:address_purchase).permit(:postal_code, :prefecture_id, :city, :address, :building, :tell, :purchase_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 住所
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  

end
