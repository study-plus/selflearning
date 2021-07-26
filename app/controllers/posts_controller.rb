class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search] == nil
      @posts = Post.all
      @myposts = Post.where(user_id: current_user.id)
    elsif params[:search] == ''
      @posts = Post.all
      @myposts = Post.where(id: current_user.id)
    else
      @posts =   Post.where("subject_name LIKE ? OR content LIKE ? ",'%'+params[:search]+'%','%'+params[:search]+'%')
      @myposts = Post.where(id: current_user.id).where("subject_name LIKE ? OR content LIKE ? ",'%'+params[:search]+'%','%'+params[:search]+'%')
    end
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.total = post.hour + (post.minutes/60)
    if post.save
        redirect_to posts_path
    else
        redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])

    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.user_id = current_user.id
    if post.update(post_params)
        redirect_to posts_path
    else
        redirect_to edit_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
      params.require(:post).permit(:subject_name, :content, :hour, :minutes)
  end
end

# Refferrences
# https://qiita.com/tseno/items/70d39f7c0e8e1c779b5e
