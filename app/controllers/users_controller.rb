class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.search(params[:search]).paginate(page: params[:page])
  end

  def show
    if User.find(params[:id])
    	@user = User.find(params[:id])
      @microposts = @user.microposts.paginate(page: params[:page])
      @races = @user.races.paginate(page: params[:page])
    elsif signed_in?
      flash[:error] = "That user does not exist."
      redirect_to root_url
    end
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the racelockr, "+@user[:name]+"!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def races
    @title = "Races"
    @user = User.find(params[:id])
    @races = @user.races.paginate(page: params[:page])
    render 'show_races'
  end

  private
  	def  user_params
  		params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
  	end

    #before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) and flash[:error] = "You cannot edit that user." unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
