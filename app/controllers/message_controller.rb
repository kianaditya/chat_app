# frozen_string_literal: true

class MessageController < ApplicationController
  def create
    message = Message.new(message_params)
    chat = Chat.find_by_id(message_params[:chat_id])
    if message.save
      # MessageChannel.broadcast_to "chat_#{chat.id}", message
      # ChatChannel.broadcast_to('chat_channel', message: message)
      ActionCable.server.broadcast("chat_channel_#{chat.id}", message: message.text, from: current_user.email)
      # redirect_to chat_path(chat)
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :chat_id, :user_id)
  end
end
