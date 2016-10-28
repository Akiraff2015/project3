# # json.extract! @userlist, :name, :email, :id

# # json.list @userlist.lists, :title, :description
# # json.restaurant @list.restaurants, :name


# json.array! (@userlists) do |json, userlist|
#   json.(userlist, :name, :email, :id)
#   json.list userlist.list do |json, list|
#     json.id list.id
#     json.title list.title
#     json.description list.description
#     json.restaurants list.restaurant do |json, restaurant|
#       json.restaurant_name restaurant.name
#     end
#   end
# end