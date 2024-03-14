class MessagesController < ApplicationController
  def index
    @messages = Message.where(receiver: current_user) + Message.where(sender: current_user)

  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @users = User.where.not(id: current_user.id)
    @requests = Request.all
  end

  def create
    @message = Message.new(message_params)
    @users = User.all
    if @message.save
      redirect_to messages_path(user_id: @message.receiver_id), notice: 'Message successfully sent.'
    else
      render :new
      # raise
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path, notice: 'Message was successfully deleted.'
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :receiver_id, :request_id)  # Add :request_id
  end
end
