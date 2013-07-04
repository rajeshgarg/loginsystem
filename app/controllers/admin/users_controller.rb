class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(:admin_users, :notice => 'Registration successfull.') }
        format.json  { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @user = current_user
  end

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_url
  end

  def edit
    @user = User.find(params[:id])#current_user
  end

  def update
    # @user = current_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to admin_user_url
    else
      render :action => :edit
    end
  end
end
