json.array!@lists do |list|
  json.merge! list.attributes
  json.list_restaurants   list.restaurants
  json.user_bookmarks list.user.bookmarks
end

  # json.(list, :title, :description)
  # json.restaurants list.restaurants, :id, :name

