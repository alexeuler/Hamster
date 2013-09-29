# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def admin?
    false
    if user_signed_in? then
      if current_user.admin? then
        true
      end
    end
  end

  def require_admin
    if user_signed_in? then
      render '_admin' unless admin?
    else
      redirect_to new_user_session_path
    end
  end  

  def after_sign_in_path_for(resource)
    '/'
  end

end
