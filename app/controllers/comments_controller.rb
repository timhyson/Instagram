class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(review_params)
    redirect_to photos_path
  end

  def review_params
    params.require(:comment).permit(:thoughts)
  end
end
