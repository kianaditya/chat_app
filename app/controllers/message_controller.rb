class MessageController < ApplicationController
  def create
    message = Message.new(message_params)
    chat = Chat.find_by_id(message_params[:chat_id])
    if message.save
      # MessageChannel.broadcast_to chat, message
      # head :ok
      redirect_to chat_path(chat)
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :chat_id, :user_id)
  end
end