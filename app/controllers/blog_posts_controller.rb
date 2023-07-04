class BlogPostsController < ApplicationController
  
  def index
    @blog_posts = BlogPost.all
  end

  def new
    # Generate a empty BlogPost object to be used in the form
    @blog_post = BlogPost.new
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def create
    @blog_post = BlogPost.new(permitted_params)
    if @blog_post.save
      redirect_to blog_post_path(@blog_post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(permitted_params)
      redirect_to blog_post_path(@blog_post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def permitted_params
    params.require(:blog_post).permit(:title, :body)
  end
end