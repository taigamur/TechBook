class SessionsController < ApplicationController
    skip_before_action :authenticate, only: :create

    def create
        if(user = User.find_or_create_from_auth_hash(auth_hash))
            session[:id] = user.id
        end
        redirect_to home_index_path, notice: "ログインしました"
    end

    def destroy
        reset_session
        redirect_to new_home_path, notice: "ログアウトしました"
    end

    private

    def auth_hash
        request.env['omniauth.auth']
    end

end
