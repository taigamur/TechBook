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


    private
    def post_params
        params.require(:post).permit(
            :name, :content_private, :content_public
        ).merge(user_id: current_user.id )
    end
end
