class UsersController < AppllicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to Result Analytics #{@user.username}"
      redirect_to greports_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params_require(:user).permit(:username, :email, :password)
end