class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params(:username, :password, :first_name, :last_name))
        session_save(1, user)
        redirect_to_dash
    end

    def signin
        redirect_to_dash
    end

    def login
        return redirect_to 'login' if !user_params(:username).present? || !user_params(:password).present?
        user = User.find_by(user_params(:username))
        return redirect_to '/login' if !user
        session_save(1, user)
        redirect_to_dash
    end

    def logout
        session.destroy
        redirect_to :root
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end

end
