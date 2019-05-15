class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params(:username, :password, :first_name, :last_name, :email))
        if user.valid?
            session_save(1, user)
            redirect_to_dash
        else
            @user = User.new
            @messages = user.errors.full_messages
            render 'users/new'
        end
    end

    def signin
        redirect_to_dash
    end

    def login
        user = User.find_by(user_params(:username))
        if user && user.authenticate(params[:user][:password])
            session_save(1, user)
            redirect_to_dash
        else
            @error = "The username or password you typed in is incorrect."
            render 'users/signin'
        end
    end

    def fblogin
        @user = User.fb_login(auth)
        session_save(1, @user)
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

    def auth
        request.env['omniauth.auth']
    end

end
