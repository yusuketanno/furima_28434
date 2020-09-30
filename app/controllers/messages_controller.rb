class MessagesController < ApplicationController



  def index
    #@messages = Message.all.order("created_at DESC")
  end

  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    #@item = Item.find(params[:item_id])
    @message = Message.new(text: params[:message][:text])
    #@message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      redirect_to messages_path
    end
  end

  
  private

  def message_params
    #params.require(message).permit(:message).merge(user_id: current_user.id, item_id: @item.id)
  end

end
