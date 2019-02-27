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
    @chat_partner = get_chat_partner
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
    existing_chat_users = get_existing_chat_users
    users = get_users(existing_chat_users)
    users
  end

  def get_existing_chat_users
    existing_chat_users = []
    @chats.each do |chat|
      chat.users.each do |user|
        existing_chat_users.push(user)
      end
    end
    existing_chat_users
  end
  
  def get_users(existing_chat_users)
    users = []
    all_users = User.all
    all_users.each do |user|
      unless existing_chat_users.include?(user)
        users.push(user)
      end
    end
    users
  end

  def get_chat_partner
    chat_partner = ''
    @chat.users.each do |user|
      unless user == current_user
        chat_partner = user
      end
    end
    chat_partner
  end
end
