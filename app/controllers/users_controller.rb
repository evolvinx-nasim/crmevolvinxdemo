class UsersController < ApplicationController
  before_filter :authenticate_user
  before_filter :admin_user, :except => [:edit, :update]

  def new
    @member= Member.new
    @roles = Role.find(:all)
  end

  def index
    @members = Member.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @member = Member.new
    @member.username = params[:member][:username]
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation =params[:member][:password_confirmation]
    @member.unique_id = genarate_unique_key
    @member.role_id = params[:member][:role_id]
    @member.valid?

    if @member.errors.blank?
      @member.save

      flash[:notice] = "New user created successfully!"
      redirect_to :users
    else
      respond_to do |format|
        flash[:error] = @member.errors.full_messages.to_sentence
        format.html { redirect_to :action => "new" }
      end
    end
  end

  def edit
    @member = Member.find_by_unique_id(params[:id])
    @roles = Role.find(:all)
  end

  def update
    @member = Member.find_by_unique_id(params[:id])
    respond_to do |format|
      if @member.update_attributes(params[:member])
        flash[:notice] = "Profile updated successfully!"
        if current_member.role_id == 1
          format.html { redirect_to :action => "index" }
        else
          format.html { redirect_to :action => "edit" }
        end
      else
        flash[:error] = @member.errors.full_messages.to_sentence
        format.html { redirect_to :action => "edit" }
      end
    end
  end

  def destroy
    @user = Member.find_by_unique_id(params[:id])
    @user.destroy
    respond_to do |format|
      flash[:notice] = "User deleted successfully!"
      format.html { redirect_to(users_path) }
    end
  end

end
