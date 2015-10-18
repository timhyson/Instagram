class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find params[:photo_id]
    @comment = @photo.comments.build_with_user(comment_params, current_user)

    if @comment.save
      redirect_to photos_path
    else
      if @comment.errors[:user]
        redirect_to photos_path, alert: 'You have already commented on this photo'
      else
        render :new
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
