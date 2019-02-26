class ChatController < ApplicationController
    def index
      @users = User.all
      all_chats = Chat.all
      @chats = []
      all_chats.each do |chat|
        if chat.users.includes(current_user)
          @chats.push(chat)
        end
      end
    end

    def show
      @chat = Chat.find(params[:id])
      @messages = Message.where(chat_id: params[:id])
    end
end
