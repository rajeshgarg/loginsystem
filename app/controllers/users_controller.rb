class UsersController < ApplicationController
  before_filter :require_user,  :only => [:show, :edit, :update]

  def new
    @user = User.new
    @authorizations = @user.authorizations
    
  end

  def create    
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(:users, :notice => 'Registration successfull.') }
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

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_url
    else
      render :action => :edit
    end
  end

end
