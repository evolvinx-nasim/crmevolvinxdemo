class RolesController < ApplicationController
  before_filter :authenticate_user
  before_filter :admin_user

  def index
    @roles = Role.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @role= Role.new
  end

  def create
    @role = Role.new

    @role.name = params[:role][:name]
    @role.enabled = 1
    @role.list_position = 0
    
    @role.valid?

    if @role.errors.blank?
      @role.save

      flash[:notice] = "New role has been created successfully."
      redirect_to :roles
    else
      flash[:error] = @role.errors.full_messages.to_sentence
      render :action => "new"
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:notice] = "Role is updated successfully."
        format.html { redirect_to :action => "index" }
      else
        flash[:error] = @role.errors.full_messages.to_sentence
        format.html { redirect_to :action => "edit" }
      end
    end
  end

  def destroy
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.id == 1
        flash[:error] = "Admin role can not be deleted!"
        format.html { redirect_to :action => "index" }
      else
        @role.destroy
        flash[:notice] = "Role deleted successfully!"
        format.html { redirect_to :action => "index" }
      end
    end
  end

end