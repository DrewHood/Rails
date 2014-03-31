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
  
end
