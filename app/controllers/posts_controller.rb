class PostsController < ApplicationController
 before_action :set_post, only: %i[show edit update destroy]
 before_action :move_to_index,except: :index
  def index
    @posts=Post.order(id: :asc)
  end

  def show
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.create(title: post_params[:title],content: post_params[:content],user_id: current_user.id)
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
    @post.update(title: post_params[:title],content: post_params[:content],user_id: current_user.id)
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
    params.require(:post).permit(:title,:content)
  end 
end
