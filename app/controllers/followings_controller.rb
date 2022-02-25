class FollowingsController < ApplicationController

    def show
        @user = User.find(params[:id])
        @users = @user.following
    end
end
