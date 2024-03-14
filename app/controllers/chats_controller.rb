class ChatsController < ApplicationController
  def show
    @sender = User.find(params[:sender_id])
    @receiver = User.find(params[:receiver_id])
    @messages = Message.where(sender: [@sender, @receiver], receiver: [@sender, @receiver]).order(created_at: :asc)
  end
end
