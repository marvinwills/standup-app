class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    redirect_to standups_path
  end

end
