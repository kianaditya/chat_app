# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_identifier
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def channel_identifier
    # self.params[:chat_id]
    code = params[:data].try(:chat_id) || params[:chat_id]
    "chat_channel_#{code}"
  end
end
