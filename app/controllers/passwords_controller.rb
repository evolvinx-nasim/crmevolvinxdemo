class PasswordsController < ApplicationController
  before_filter :authenticate_user

  def edit
    @user = current_member
  end
 
  def update
    @user = current_member
    if @user.update_with_password(params[:member])
      redirect_to root_path, :notice => "Your Password has been updated! Please login with your new password"
    else
      flash[:alert] = @user.errors.full_messages.join("<br />")
      render :edit

    end
  end
end