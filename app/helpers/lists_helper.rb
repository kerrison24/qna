module ListsHelper
  def correct_user_for_list
    @list = List.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    if @list.user_id != @user.id
      flash[:danger] = "This is not your session"
      redirect_to root_url
    end
  end
end
