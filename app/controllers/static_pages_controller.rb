class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new
    @photos = flickr.people.getPublicPhotos(:user_id => params[:user_id]) if params[:user_id]
  end
end
