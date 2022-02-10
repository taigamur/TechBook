module SessionsHelper

    def current_user
        return unless (user_id = session[:id])
        @current_user ||= User.find_by(id: user_id)
    end

    def log_in(user)
        session[:id] = user.id
    end

    def log_out
        session.delete(:id)
        @current_user = nil
    end
    
    
end
