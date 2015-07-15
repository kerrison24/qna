class ListsController < ApplicationController
  include ListsHelper
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :correct_user_for_list, only: [:edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def show
    @list = List.find(params[:id])
    @user = User.find(@list.user_id)
    if current_user.nil?
      flash.now[:notice] = "Must log in to like a question"
    end
  end

  def create
    user = User.find_by(id: session[:user_id])
    @list = user.lists.create(list_params)
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    List.find(params[:id]).destroy
    flash[:success] = "Session successfully deleted"
    redirect_to root_url
  end

  private
    def list_params
      params.require(:list).permit(:title, :description)
    end
end
