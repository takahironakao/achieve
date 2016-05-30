class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_actionでdeviseのストロングパラメーターにnameカラムを追加するメソッドを実行します。
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
    # deviseで使用するストロングパラメーターに項目を追加するメソッドです。
    def configure_permitted_parameters
      # サインアップ時にnameカラムを許容するようにします。
      devise_parameter_sanitizer.for(:sign_up) << :name
      # アカウント更新時にnameカラムを許容するようにします。
      devise_parameter_sanitizer.for(:account_update) << :name
    end
end