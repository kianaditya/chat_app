# frozen_string_literal: true

class MessageController < ApplicationController
  before_action :authenticate_user!
  def create
    message = current_user.messages.new(message_params)
    chat = Chat.find_by_id(message_params[:chat_id])
    if message.save
      ActionCable.server.broadcast("chat_channel_#{chat.id}", message: message.text, from: current_user.email)
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :chat_id)
  end
end
