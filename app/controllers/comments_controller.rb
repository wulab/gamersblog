class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = article.comments.build(params[:comment])
    
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
    redirect_to comment.article
  end
  
end
