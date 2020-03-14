class MessagesController < ApplicationController
  before_action :to_root, except: [:index]
  def index
    @messages = Message.all
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    @message.save
    respond_to do |format|
      format.json {render json: { ccc: @message.message , ddd: @message.user.email}}
    end
  end
  private
  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id)
  end
  def to_root
    redirect_to root_path unless user_signed_in?
  end
end

