class Api::V1::UsersController < ApplicationController

    # skip_before_action :authenticate, only: :index
    def index
        # users = User.find(1)
        # render 1000
        test = {id:1, name:"test"}
        render json: test
    end

end
