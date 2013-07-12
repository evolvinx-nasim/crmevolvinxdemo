class ApplicationController < ActionController::Base
  def authenticate_user
    if current_member.nil?
      flash[:error] = 'You must be signed in to access this area.'
      redirect_to :new_member_session
    end
  end
  def admin_user
    if current_member.nil?
      flash[:error] = 'You must be signed in to access this area.'
      redirect_to :new_member_session
    else
      if (current_member.role_id != 1)
        flash[:error] = 'You must be signed in as admin to access this area.'
        redirect_to :root
      end
    end
  end
  def genarate_unique_key
    random_string = SecureRandom.hex
  end


  private
  def after_sign_out_path_for(resource_or_scope)
    new_member_session_path
  end
end
