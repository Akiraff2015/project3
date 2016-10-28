# controls the list the current_user owns

# module: API
class API::UserListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_userlists, only: [:index]
  before_action :set_userlist, only: [:show, :update, :destroy]

# CRUD
# 1
  def index
  end

# 2
  def show
    render json: @list
  end

# 3
  def create
    @userlist = current_user.lists.new(userlist_params)

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

    def email
      @email = List.find_by(id: param[:id]).user.email
    end

    def set_userlists
      @lists = current_user.lists
    end

    def set_userlist
      @list = current_user.lists.find_by(id: params[:id])
      if @list.nil?
        render json: {message: "Cannot find '#{params[:id]}'"}
      end
    end

    def userlist_params
      params.require(:list).permit(:title, :description)
    end
  end
