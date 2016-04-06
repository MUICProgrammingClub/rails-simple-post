class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = @current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        @post = @comment.post
        format.html { render 'posts/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
