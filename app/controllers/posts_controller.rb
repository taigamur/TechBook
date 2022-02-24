class PostsController < ApplicationController

    def new
        @title = params[:name]
        @author = params[:author]
        @image = params[:image]
        @post = current_user.posts.build 
    end

    def create
        @post = current_user.posts.build(post_params)


        @title = params[:name]
        @author = params[:author]
        @image = params[:image]
        
        if @post.save
            redirect_to @current_user
        else
           redirect_to new_post_path
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

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to @post, notice: "Updated"
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy!
        redirect_to current_user, notice: "Deleted"
    end

    private
    def post_params
        params.require(:post).permit(
            :name, :content_private, :content_public, :author, :image_url, :point, :difficulty
        ).merge(user_id: current_user.id )
    end
end
