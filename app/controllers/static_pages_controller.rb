class StaticPagesController < ApplicationController
  require 'flickr'
rescue_from Flickr::FailedResponse, with: :unknown_user

  def index
    flickr = Flickr.new
    @photos = flickr.people.getPublicPhotos(:user_id => params[:user_id]) if params[:user_id]
  end

  def unknown_user
    render :index
  end  
end
