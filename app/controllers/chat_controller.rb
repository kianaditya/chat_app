class ChatController < ApplicationController
  def index
    if user_signed_in?
      @chats = current_user.chats
      @users = get_users(get_existing_chat_users)
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = Message.where(chat_id: params[:id])
    @chat_partner = @chat.users.select { |user| user != current_user }.first
  end

  def create
    user = User.find_by_id(params[:user])
    chat = Chat.create()
    chat.users << [current_user, user]
    redirect_to chat_path(chat)
  end

  private

  def get_existing_chat_users
    @chats.map{ |chat| chat.users.select{ |user| user }}.flatten
  end

  def get_users(existing_chat_users)
    User.all.select{ |user| !existing_chat_users.include?(user) }
  end
  
end
