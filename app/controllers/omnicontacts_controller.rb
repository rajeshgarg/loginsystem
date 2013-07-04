class OmnicontactsController < ApplicationController
  

  def index
     redirect_to "/contacts/facebook"
  end
  def callback
    @contacts = request.env['omnicontacts.contacts']
    puts @contacts.inspect
    render :json=> @contacts
    # @user = request.env['omnicontacts.user']
    # puts "List of contacts of #{@user[:name]} obtained from #{params[:importer]}:"
    # @contacts.each do |contact|
    #   puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
    # end
  end
  def failure
    callback
  end
end