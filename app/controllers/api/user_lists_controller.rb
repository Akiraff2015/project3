# module: API
class API::UserListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_userlists, only: [:index]
  before_action :set_userlist, only: [:show, :update, :destroy]

  def index
    render json: @userlists
    render json: @email
  end

# 2
  def show
    render json: @userlist
  end

  def create
    @userlist = current_user.lists.new(userlist_params)

    if @userlist.save
      render json: @userlist
    else
      render json: @userlist.errors.messages, status: 422
    end
  end

  def update
    @userlist.assign_attributes(userlist_params)

    if @userlist.save
      render json: @userlist
    else
      render json: @userlist.errors.messages, status: 422
    end
  end

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
      @userlists = current_user.lists
    end

    def set_userlist
      @userlist = current_user.lists.find_by(id: params[:id])
    end

    def userlist_params
      params.require(:list).permit(:title, :description)
    end
  end
