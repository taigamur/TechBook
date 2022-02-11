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
        @post = current_user.posts.find(params[:id])
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to @post, notice: "更新しました"
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy!
        redirect_to root_path, notice: "削除しました"
    end

    private
    def post_params
        params.require(:post).permit(
            :name, :content_private, :content_public
        ).merge(user_id: current_user.id )
    end
end
