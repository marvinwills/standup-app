class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    user_standups_path(resource)
  end
  
  def after_sign_in_path_for(resource)
    user_standups_path(resource)
  end
 
  private
 
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end