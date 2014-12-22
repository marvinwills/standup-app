class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_standup

  def new
    @comment = @standup.comments.build
  end

  def create
    @comment = @standup.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to standups_path
    else
      render "new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_standup
    @standup = current_user.standups.find(params[:standup_id])
  end
end
