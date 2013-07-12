class AccountsController < ApplicationController
  before_filter :authenticate_user

  def index
    @accounts = Account.find(:all)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    @account[:owner] =  current_member.id
    @account[:unique_id] =  genarate_unique_key
    respond_to do |format|
      begin
        if @account.save
          format.json { render :json => {"success" => true, "message" => "Successfully created!"} }
        else
          format.json { render :json => {"error" => true, "exception" => @account.errors.full_messages.to_sentence} }
        end
      rescue =>e
        @error= e.message
        format.json { render :json => {"error" => true, "exception" => @error} }
      end
    end
  end

  def show
    @title = t "account.t_view"
    @account = Account.find_by_unique_id(params[:id])
  end

  def edit
    @title = t "account.t_edit_account"
    @account = Account.find_by_unique_id(params[:id])
  end

  def update
    @title = t "account.t_update_account"
    @account = Account.find_by_unique_id(params[:id])
    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = "Successfully updated the account!"
        format.html { redirect_to(:action => "show") }
        format.xml { head :ok }
      else
        flash[:error] = @account.errors.full_messages.to_sentence
        format.html { redirect_to :action => "edit" }
      end
    end
  end

  def get_contacts
    @accKey = params[:id]
    @find = Account.where("unique_id = ?", @accKey).first
    @contacts = Contact.find(:all, :conditions => [ "account_name = ?", @find.id ])
    render :layout => false
  end

  def destroy
    @title = t "account.t_delete_account"
    @account = Account.find_by_unique_id(params[:id])
    @account.destroy
    respond_to do |format|
      flash[:notice] = "Account deleted successfully!"
      format.html { redirect_to(accounts_path) }
    end
  end

end
