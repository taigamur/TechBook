class PostsController < ApplicationController

    def new
        @title = params[:name]
        @author = params[:author].join(' ')
        @image = params[:image]
        @post = current_user.posts.build 
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to @current_user
        else
            @title = @post.name
            @author = @post.author
            @image = @post.image_url
            if @title == nil
                redirect_to new_search_path
            else
                render "/posts/new"
            end
        end
    end

    def index
        
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
            redirect_to @current_user, notice: "Updated"
        else
            render '/posts/edit'
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
