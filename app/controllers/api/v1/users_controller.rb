class Api::V1::UsersController < ApplicationController

    skip_before_action :authenticate
    def index
        users = User.all
        render json: users.to_json(only: [:id, :name])
    end

end
