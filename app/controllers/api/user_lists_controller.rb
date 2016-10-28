# module: API
class API::UserListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_userlists, only: [:index]
  before_action :set_userlist, only: [:show, :update, :destroy]
  before_action :set_list

# CRUD
# 1
  def index
    render json: @userlists
  end

# 2
  def show
    render json: @userlist
  end


# 3
  def create
    @userlist = List.new(userlist_params)

    if @userlist.save
      render json: @userlist
    else
      render json: @userlist.errors.messages, status: 422
    end
  end

# 4
  def update
    @userlist.assign_attributes(userlist_params)

    if @userlist.save
      render json: @userlist
    else
      render json: @userlist.errors.messages, status: 422
    end
  end

# 5
  def destroy
    @userlist.destroy
    head 204
  end



# PRIVATE METHODS
  private

    def set_list
      @list = List.find_by(id: params[:id])
    end

    def set_userlists
      @userlists = User.includes(:lists).all
      # current_user.lists
    end

    def set_userlist
      @userlist = User.includes(:lists).find_by(id: params[:id])
      # current_user.lists.find_by(id: params[:id])
    end

    def userlist_params
      params.require(:list).permit(:title, :description)
    end
  end
