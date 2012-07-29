class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :new, :edit, :update, :destroy, :show]
  before_filter :editor_user, only: [:new, :create, :update, :edit]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.all(order: 'admin DESC, editor DESC, name')
  end

  def show
    # Wrapping a single user in an array so we can put inside
    # an @user.each do block.
    @user = [User.find(params[:id])]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Yale CTS Listings"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      if !current_user.editor?
        flash[:error] = "You are not an administrator."
        redirect_to users_path
      end
    end

    def editor_user
      if !current_user.editor?
        flash[:error] = "You do not have patient editing privileges."
        redirect_to users_path
      end
    end

    def viewer_user
      if !current_user.viewer?
        flash[:error] = "You do not yet have patient viewing privileges."
        redirect_to users_path
      end
    end
end