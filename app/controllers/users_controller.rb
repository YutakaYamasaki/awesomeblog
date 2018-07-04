class UsersController < ApplicationController

# before_action :ensure_correct_user, except: :new

# before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
# before_action :ensure_correct_user,{only:[:edit,:update,:show]}

before_action :require_login, except: :new
before_action :correct_user, only: [:edit,:update]
before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save  
      flash[:success] = "Welcome to Awesome Blog App"
      log_in @user
    redirect_to @user
    else
    render "new"
    end
  end

  # def login
  #   @user = User.find_by(user_params)
  #   end
  def edit
    # @user = User.find(params[:id])

  end

  def update
    # user = User.find_by(id: params[:id])
    # @user.password = params[:password]
    if @user.update_attributes(user_params);
      flash[:success] = "Updated your information successfully"
    redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page],per_page:15)
    @relationship = current_user.active_relationships.build
  end

  def index
    @users = User.paginate(page: params[:page],per_page:15)
  end

  def destroy
    user = User.find(params[:id])
    flash[:info] = "Successfully delete user:#{user.email}"
    user.destroy
  end
  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   redirect_to new_users_path
  # end

  # private

  #  def user_params
  #    params.require(:user).permit(:name)
  #  end

  # def ensure_correct_user
  #   if @current_user.id != params[:id].to_i
  #     flash[:danger] = "wwww"
  #     redirect_to users_path
  #   end
  # end



  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:danger] = "You are not allowed here."
      redirect_to root_url
    end
  end
  def admin_user
    unless current_user.admin?
      flash[:danger] = "You are not allowed to do that?"
      redirect_to root_url
    end
  end


  def following
      @user = User.find(params[:id])
      @users = @user.following
      @title = "following"
      render 'show_follow'
  end

  def followers
      @user = User.find(params[:id])
      @users = @user.followers
      @title = "followers"
      render 'show_follow'
  end
private
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end



end
