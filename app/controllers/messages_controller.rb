class MessagesController < ApplicationController
  def index
    @messages = Message.where(receiver: current_user) + Message.where(sender: current_user)
  end

  def new
    @message = Message.new
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    @users = User.all
    if @message.save
      redirect_to messages_path(user_id: @message.receiver_id)
    else
      render :new
      # raise
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :receiver_id)
  end
end
