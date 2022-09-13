class CommentsController < ApplicationController
  before_action :authenticate
  before_action :load_blog
  before_action :load_comment, except: [:index, :new, :create]
  def index
    @comments = @blog.comments
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new comment_params
    if @comment.name == current_user.name
      if @blog.comments << @comment
        redirect_to blog_comments_path, notice: "Comment has been successfully created"
      else
        render :new
      
      end
    else
      redirect_to blog_comments_path, alert: "Not allow"
    end
  end 
  
  def show
  end
  
  def edit 
  end
  
  def update
    if @comment.name == current_user.name
      if @comment.update comment_params
        redirect_to [@blog,@comment] , notice: "Comment has been updated"
      else
        render :edit
      end
    else
      redirect_to [@blog,@comment] , alert: "Not allowd"
    end
  end
  
  def destroy
    if @comment.name == current_user.name
      @comment.destroy
      redirect_to blog_comments_path, alert: "Successfully delete the post"
    else
      redirect_to blog_comments_path, alert: "You don't have access to delete"
    end
  end
  
  private 
  def load_comment
    @comment = @blog.comments.find params[:id]
  end
  
  def load_blog
    @blog = Blog.find params[:blog_id]
  end
  
  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
