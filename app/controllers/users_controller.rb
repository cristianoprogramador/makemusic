class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]

  def show
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Perfil atualizado com sucesso!'
    else
      render :show
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :avatar_url)
  end
end
