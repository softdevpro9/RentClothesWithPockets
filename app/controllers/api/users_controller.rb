class Api::UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            signin(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 404
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
