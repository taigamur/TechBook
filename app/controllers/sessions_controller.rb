class SessionsController < ApplicationController
    skip_before_action :authenticate, only: :create

    def create
        if(user = User.find_or_create_from_auth_hash(auth_hash))
            session[:id] = user.id
        end
        redirect_to root_path # , notice: "Welcome"
    end

    def destroy
        reset_session
        redirect_to login_path # , notice: "ログアウトしました" 変更
    end

    private

    def auth_hash
        request.env['omniauth.auth']
    end

end
