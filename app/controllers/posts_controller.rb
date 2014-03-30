class PostsController < ApplicationController

def new
end

def create
 @post = Post.new(post_params)
 @post.save
 
 respond_to do |format|
   format.html { redirect_to @post }
   format.xml { render :xml => @post }
 end
/ redirect_to @post/
end

def show
  @post = Post.find(params[:id])
  
  respond_to do |format|
    format.html
    format.xml { render :xml => @post }
  end
end

def index
  @posts = Post.all
  
  respond_to do |format|
    format.html
    format.xml { render :xml => @posts }
  end
end

private
  def post_params
    params.permit(:title, :text, :post)
  end

end
