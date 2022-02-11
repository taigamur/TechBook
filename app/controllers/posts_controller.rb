class PostsController < ApplicationController

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to root_path
        end
    end

    # 自分のリスト
    def index
        @posts = current_user.posts
    end

    # 自分の個別
    def show
        @post = Post.find(params[:id])
    end


    private
    def post_params
        params.require(:post).permit(
            :name, :content_private, :content_public
        ).merge(user_id: current_user.id )
    end
end
