class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_actionでdeviseのストロングパラメーターにnameカラムを追加するメソッドを実行します。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  
  protected
    # deviseで使用するストロングパラメーターに項目を追加するメソッドです。
    def configure_permitted_parameters
      # サインアップ時にnameカラムを許容するようにします。
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント更新時にnameカラムを許容するようにします。
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    
    
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.for(:account_update).push(PERMISSIBLE_ATTRIBUTES)
    end

end