class PostsController < ApplicationController

def new
end

def create
 @post = Post.new(post_params)
 @post.save
 
 respond_to do |format|
   format.html { redirect_to @post }
   format.xml { render :xml => @post, :status => :created, :location => @post }
 end
/ redirect_to @post/
end

def update
  @post = Post.find(params[:id])
  @post.update(params)
  
  @info = [params, @post]
  
  respond_to do |format|
    format.html { redirect_to @post }
    format.xml { render :xml => @info, :location => @post }
  end
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
    format.json { render :json => @posts }
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  
  return head(:no_content)
end

private
  def post_params
    params.permit(:title, :text, :post)
  end

end
