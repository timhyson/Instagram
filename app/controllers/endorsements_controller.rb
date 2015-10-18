class EndorsementsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @comment.endorsements.create
    render json: { new_endorsement_count: @comment.endorsements.count }
  end

end
