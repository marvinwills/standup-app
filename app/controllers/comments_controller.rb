class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @standup = current_user.standups.find(params[:standup_id])
    @comment = @standup.comments.build
  end

  def create
    standup = current_user.standups.find(params[:standup_id])
    comment = standup.comments.build(comment_params)
    comment.user = current_user

    comment.save

    redirect_to standups_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
