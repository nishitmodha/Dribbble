class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
  	@shot = Shot.find(params[:shot_id]) 
  	@comment = @shot.comments.create(comment_params)
  	@comment.user_id = current_user.id if current_user
  	@comment.save!

  	redirect_to shot_path(@shot)
  end

  def destroy
    @comment = @shot.comments.find(params[:id])
    @comment.destroy

    redirect_to shot_path(@shot)
  end

  private

  def set_comment
    @shot = Shot.find(params[:shot_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end
