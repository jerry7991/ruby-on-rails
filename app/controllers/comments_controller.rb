class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def edit
    @comments = Comment.find(params[:comment_id])
  end

  def update 
    
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  def create 
    @article = Article.find(params[:article_id])
    @comments = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
