class PostsController < ApplicationController
    
    def index

        if current_user
            @posts = Post.where(user_id: current_user.id).order('views DESC')
        elsif 
            @posts = Post.order('created_at DESC')
        end
    end
    
    def new
        @post = Post.new
    end
    
    def show
        @post = Post.find(params[:id])
        views = @post.views
        if !views
            views = 0
        end
        views = views + 1
        @post.views = views
        @post.save!
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        
        if @post.save!
            redirect_to posts_path
        elsif 
            render 'new'
        end
        
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
end
