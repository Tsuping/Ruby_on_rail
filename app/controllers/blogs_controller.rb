class BlogsController < ApplicationController
  before_action :authenticate
  # read all post
  # GET
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs
  def index
    @blogs = Blog.all
    @comments = Comment.all
  end
  # Create a form for create new post
  # GET
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs/new
  def new
    @blog = Blog.new
  end
  
  # This route is going to save the post into the database
  # POST
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs
  def create
    @blog = Blog.new blog_params
    @blog.user = current_user
    if @blog.author == current_user.name
      if @blog.save
        redirect_to blogs_path, notice: "Blog has been successfully created"
      else
        render :new
      
      end
    else
      redirect_to new_blog_path, alert: "The name should be your account"
    end
  end 
  # Read one method
  # GET
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs/:id
  def show
    @blog = Blog.find params[:id]
    @comment = Comment.new
  end
  # Create a update form for update the information
  # GET
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs/:id/edit
  def edit
    @blog = Blog.find params[:id]
    
  end
  
  def search
    if params[:search].blank?
      @blogs = Blog.all
    else
      @blogs = Blog.search(params)
    end
  end
  # After update the information, this method is going to be called and save the updated info into database
  # PATCH/PUT
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs/:id
  def update
    @blog = Blog.find params[:id]
    if @blog.author == current_user.name
      if @blog.update blog_params
        redirect_to @blog, notice: "Blog has been updated"
      else
        render :'edit'
      end
    else
      redirect_to @blog, alert: "Cannot update"
    end
  end
  # this methods will be called when we want to delete the post from the database
  # DELETE
  # https://9d622a0a900e46babd33dfb4aff11d0b.vfs.cloud9.us-east-1.amazonaws.com/blogs
  def destroy
    @blog = Blog.find params[:id]
    if @blog.author == current_user.name
      @blog.destroy
      redirect_to blogs_path, alert: "Successfully delete the post"
    else
      redirect_to blogs_path, alert: "Not allow deleting the post"
    end
  end

  
  private 
  # This is the helper function for get every params for one post
  def blog_params
    params.require(:blog).permit(:title, :content, :author, :time, images: [])
  
  end
end


