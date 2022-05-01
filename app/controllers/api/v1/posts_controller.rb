class Api::V1::PostsController < ApplicationController

    def index
        posts = Post.where(user_id: params[:user_id]).order(id: "DESC")
        render json: posts.to_json(only: [:user_id, :name, :content_public])
    end
end
