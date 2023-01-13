class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new
    @photos = flickr.people.getPublicPhotos(:user_id => params[:user_id]) if params[:user_id]

    respond_to do |format|
      format.html
      format.xml { render :xml => @photos }
      format.json {render :json => @photos }
    end
  end
end
