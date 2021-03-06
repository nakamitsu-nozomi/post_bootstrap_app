class PostsController < ApplicationController
 before_action :set_post, only: %i[show]
 before_action :limit_current_user, only: %i[edit update destroy]
 before_action :move_to_index,except: :index
  def index
    @posts=Post.order(id: :desc).includes(:user)
  end

  def show
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.create(content: post_params[:content],user_id: current_user.id,image: post_params[:image])
    if @post.save
      redirect_to @post,notice: "投稿しました"
    else
      flash.now[:alert]="投稿に失敗しました"
      render :new
    end
  end

  def edit
   
  end

  def update
    @post.update(content: post_params[:content],user_id: current_user.id,image: post_params[:image])
    if @post.save
      redirect_to @post,notice: "更新しました"
    else
      flash.now[:alert]="更新に失敗しました"
      render :edit
    end    
  end

  def destroy
    @post.destroy!
    redirect_to root_path,alert: "削除しました"
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end  

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content,:image)
  end

  def limit_current_user
    @post= current_user.posts.find_by(id: params[:id])
  end  
end
