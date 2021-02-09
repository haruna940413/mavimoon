class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when admin
      admin_homes_top_path
    when user
      user_items_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else 
      root_path
    end
  end


  private

  def configure_permitted_parameters
    # ユーザー側
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email,:first_name,:last_name,:first_furigana,:last_furigana,
    :phone_number,:postal_code,:address,:user_status])
    # 管理者側
    devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
  end

end
