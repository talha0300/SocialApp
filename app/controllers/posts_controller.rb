class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_posts, only: [:index]
  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @posts=Post.find(params[:id])
    @posts=[@posts]
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
      post.attachment=""
    end
    #debugger
    if @post.save
      redirect_to post_path(@post)
    else
      render "new", notice: @post.errors.full_messages.first
    end
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    #respond_to do |format|
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
    #end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
    Notification.destroy_notifications(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_posts

      @posts = Post.where("user_id=#{current_user[:id]}")
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :image, :user_id)
    end
end
