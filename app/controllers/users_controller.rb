class UsersController < ApplicationController

    def new
        @user = current_user
    end

    # 個別のユーザーを表示
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order(id: "DESC")
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to @user, notice: "Updated"
        end
    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(
            :name, :image
        )
    end

end
