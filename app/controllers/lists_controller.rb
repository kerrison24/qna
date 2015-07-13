class ListsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
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
  end

  def create
    @list = List.new(list_params)
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
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_url
  end

  private
    def list_params
      params.require(:list).permit(:title, :description)
    end
end
