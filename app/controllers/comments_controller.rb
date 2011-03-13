class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = article.comments.build(params[:comment])
    comment.author = current_user if user_signed_in?
    
    if comment.save
      redirect_to article
    else
      redirect_to article, :notice => "Please try again."
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash[:success] = "Successfully updated comment."
      redirect_to @comment.article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = "Successfully deleted comment."
    redirect_to comment.article
  end
  
end
