class ApplicationController < ActionController::Base

    before_action :authenticate
    helper_method :logged_in?, :current_user

    def check_logged_in
        return if current_user
        redirect_to new_home_path
    end
    
    private

    def logged_in?
        !!current_user
    end


    def current_user
        return unless session[:id]
        @current_user ||= User.find(session[:id])
    end

    def authenticate
        return if logged_in?
        redirect_to new_home_path, alert: "ログインしてください"
    end
end
