class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    standups_path
  end
  
  def after_sign_in_path_for(resource)
    standups_path
  end
  
  def after_update_path_for(resource)
    standups_path
  end
 
  private
 
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
 
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end