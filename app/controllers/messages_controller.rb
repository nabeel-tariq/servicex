class MessagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :create
  def new
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], (params[:message][:subject] || current_user.full_name)).conversation
    if conversation
      flash[:success] = "Message has been sent!"
      redirect_to conversation_path(conversation)
    else
      flash[:error] = "Message has not been sent!"
      redirect_to :back
    end

  end
end
