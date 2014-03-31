class UsersController < ApplicationController
  /doorkeeper_for :all/
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.xml { render :xml => @users }
      format.json { render :json => @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.xml { render :xml => @user }
      format.json { render :json => @user }
    end
  end
  
  def create
    @user = User.new(post_params)
    @user.save
    
    respond_to do |format|
      format.xml { render :xml => @user }
      format.json { render :json => @user }
    end
  end
  
  private
    def post_params
      params.permit(:name, :username, :password, :user)
    end
  
end
