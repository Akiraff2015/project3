json.extract! @list, :id, :title, :description

json.restaurant @list.restaurants, :name
json.user @list.user, :name
# json.array! @list do |list|
#   json.merge! list.attributes
#   # this gives me :title, :description, :user_id
#   json.user_email   list.user.email
# end

# can use helper. e.g. json.edit_url edit_list_url(@list) if user_signed_in?