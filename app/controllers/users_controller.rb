class UsersController < ApplicationController

    def new
        @user = current_user
    end

    # ユーザー全員を表示
    def index
        @users = User.all
    end

    # 個別のユーザーを表示
    def show
        @user = User.find(params[:id])
        @posts = @user.posts
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to @user, notice: "更新しました"
        end
    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(
            :name
        )
    end

end
