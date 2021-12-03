class UsersController < ApplicationController
  before_action :update_params, only: [:update]
  before_action :is_admin?

    def show
      @user = User.find(current_user.id) #on affiche le profil de la personne connecté (current user)
    end

    def index
      @users = User.all
    end

    def update
      user = User.find_by(id: params[:id])
      user.is_admin = params[:user][:is_admin]
      user.save
      redirect_back fallback_location: pages_administration_path
    end

    private

    # Notice the name of the method
    def update_params
      params.require(:user).permit(:is_admin, :email, :password, :password_confirmation)
    end
    
end
