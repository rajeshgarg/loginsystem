class Admin::OrganisationsController < ApplicationController
	def index
		@org = Organisation.all
	end

	def new
		@org = Organisation.new
	end

	def edit
	  @org =  Organisation.find(params[:id])
  end
  def show
  	@org = Organisation.find(params[:id])
  end
  def create
  	@org = Organisation.new(params[:organisation])
    respond_to do |format|
      if @org.save
        format.html { redirect_to(:admin_organisations, :notice => 'Registration successfull.') }
        format.json  { render :json => @org, :status => :created, :location => @org }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @org.errors, :status => :unprocessable_entity }
      end
    end
  end
  def destroy
  	@org =  Organisation.find(params[:id])
  	@org.destroy
  	redirect_to admin_organisations_path
  end
  def update
  	@org =  Organisation.find(params[:id])
  	 
  	if @org.update_attributes(params[:organisation])
      flash[:notice] = "Updated!"
      redirect_to admin_organisation_url
    else
      render :action => :edit
    end
  end
end
