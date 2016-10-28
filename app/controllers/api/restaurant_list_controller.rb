# class API::RestaurantListController < ApplicationController
# end

# def create
#   @rl_list = current_user.lists.new(rl_list_params)

#   if @rl_list.save
#     render json: @rl_list
#   else
#     render json: @rl_list.errors.messages, status: 422
#   end
# end

# private

#   def set_rl_list
#     @rl_list = RestaurantList.find_by(id: params[:id])
#   end

#   def userlist_params
#     params.require(:list).permit(:title, :description)
#   end


# #don't forget to add routes for this