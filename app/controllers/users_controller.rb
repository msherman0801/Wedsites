class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params(:username, :password, :first_name, :last_name, uploads: []))
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

    def fblogin
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            name = auth['info']['name'].split(' ')
            u.username = "#{name[0]+name[1]}"+"#{rand(+100000)}" if u.username.nil?
            u.password = "#{rand(+100000000000000)}"
            u.first_name = auth['info']['name'].split(' ')[0]
            u.last_name = auth['info']['name'].split(' ')[1]
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
        session_save(1, @user)
        redirect_to_dash
    end

    # def fblogin
    #     @user = User.find_by(uid: auth['uid'])
    #     if !@user
    #         name = auth['info']['name'].split(' ')
    #         username = "#{name[0]+name[1]}"+"#{rand(+100000)}"
    #         @user = User.create(username: username, first_name: name[0], last_name: name[1], email: auth['info']['email'], image: auth['info']['image'], uid: auth[:uid])
    #     end
    #     session_save(1, @user)
    
    #     render '/testpage'
    # end
        

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
