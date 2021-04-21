class UsersController < ApplicationController

    def index 
        @users = User.all 
    end

    def show 
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            flash[:success] = "Welcome to Slime Social!"
            redirect_to @user 
        else
            render 'new'
        end
    end

    def edit 
    end

    def update
    end

    def destroy
    end





end