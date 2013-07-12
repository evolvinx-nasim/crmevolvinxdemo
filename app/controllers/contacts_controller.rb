class ContactsController < ApplicationController
  before_filter :authenticate_user

  def index
    @contacts = Contact.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @accounts = Account.find(:all, :conditions => [ "status = ?", 1 ])
    @contact = Contact.new
    if !params[:accid].nil?
      @find = Account.where("unique_id = ?", params[:accid]).first
      if !@find.nil?
        @contact.account_name =@find.id
      end
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact[:owner] =  current_member.id
    @contact[:unique_id] = genarate_unique_key
    respond_to do |format|
      begin
        if @contact.save
          format.json { render :json => {"success" => true, "message" => "Successfully created!"} }
        else
          format.json { render :json => {"error" => true, "exception" => @contact.errors.full_messages.to_sentence} }
        end
      rescue =>e
        @error= e.message
        format.json { render :json => {"error" => true, "exception" => @error} }
      end
    end
  end

  def show
    @title = t "contact.t_view"
    @contact = Contact.find_by_unique_id(params[:id])
  end

  def edit
    @title = t "contact.t_edit_contact"
    @accounts = Account.find(:all, :conditions => [ "status = ?", 1 ])
    @contact = Contact.find_by_unique_id(params[:id])
  end

  def update
    @title = t "contact.t_update_contact"
    @contact = Contact.find_by_unique_id(params[:id])
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = "Successfully updated the contact!"
        format.html { redirect_to(:action => "show") }
        format.xml { head :ok }
      else
        flash[:error] = @contact.errors.full_messages.to_sentence
        format.html { redirect_to :action => "edit" }
      end
    end
  end

  def destroy
    @title = t "contact.t_delete_contactt"
    @contact = Contact.find_by_unique_id(params[:id])
    @contact.destroy
    respond_to do |format|
      flash[:notice] = "Contact deleted successfully!"
      format.html { redirect_to(contacts_path) }
    end
  end
end
