class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:index, :new, :create]

  def index
    @posts = @event.posts.all
  end

  def show
  end

  def new
    @post = @event.posts.new()
  end

  def edit
  end

  def create
    @post = @event.posts.new(post_params)
    if @post.save
      redirect_to game_event_post_path(@post.game, @post.event, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to game_event_post_path(@post.game, @post.event, @post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to game_event_posts_path(@post.game, @post.event), notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def post_params
      params.require(:post).permit(:title, :checkpoint, :user_id, :event_id)
    end
end
