class ChatController < ApplicationController
    def index
      if user_signed_in?
        @chats = current_user.chats
        @users = get_available_chats
      end
    end

    def show
      @chat = Chat.find(params[:id])
      @messages = Message.where(chat_id: params[:id])
    end

    def create
      user = User.find_by_id(params[:user])
      chat = Chat.new()
      if chat.save
        chat.users << current_user
        chat.users << user
        redirect_to chat_path(chat)
      end
    end

    private

    def get_available_chats
      existing_chat_users = []
      users = []
      all_users = User.all
      @chats.each do |chat|
        chat.users.each do |user|
          existing_chat_users.push(user)
        end
      end
      all_users.each do |user|
        unless existing_chat_users.include?(user)
          users.push(user)
        end
      end
      users
    end
end
