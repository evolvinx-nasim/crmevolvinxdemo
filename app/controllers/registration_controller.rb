class RegistrationController < Devise::RegistrationsController

  def new
    #super
    @member= Member.new
  end

  def create

    @member = Member.new
    @member.username = params[:member][:username]
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation =params[:member][:password_confirmation]
    @member.unique_id = genarate_unique_key
    @member.valid?


    if @member.errors.blank?
      @member.save
     
      flash[:notice] = "created"
      redirect_to :new_member_session
    else
      render :action => "new"
    end
  end
     
end

