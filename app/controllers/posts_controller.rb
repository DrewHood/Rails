class PostsController < ApplicationController
  
  /doorkeeper_for :create, :update, :destroy/

def new
end

def create
 @post = Post.new(post_params)
 @post.save
 
 respond_to do |format|
   format.html { redirect_to @post }
   format.xml { render :xml => @post, :status => :created, :location => @post }
   format.json { render :json => @post, :status => :created, :location => @post }
 end
/ redirect_to @post/
end

def update
  @post = Post.find(params[:id])
  
  if params[:title]
    @post.update(:title => params[:title])
  end
  
  if params[:text]
    @post.update(:text => params[:text])
  end 
  
  respond_to do |format|
    format.html { redirect_to @post }
    format.xml { render :xml => @post, :location => @post }
    format.json { render :json => @post, :location => @post }
  end
end

def show
  @post = Post.find(params[:id])
  
  respond_to do |format|
    format.html
    format.xml { render :xml => @post }
    format.json { render :json => @post }
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
