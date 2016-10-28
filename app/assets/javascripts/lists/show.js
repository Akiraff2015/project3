$('.lists.show').ready(function(){
  console.log("lists showing");

  var getList = function (id, cb) {
    $.ajax({
      url: '/api/lists/' + id,
      method: 'get',
      success: function (list) {
        // $('#restaurants').html('');

        console.log('hi ' + req)

        var restaurants = []

        // for (var i = 0; i < list.restaurants.length; i++) {
        //   restaurants.push.(list.restaurants[i])
        // }

        var html = "<div class='col s12'>" +
                      "<h6>" + list.title + "</h6>" +
                      "<span>" + list.user_email + "</span>" +
                      "<i class='bookmark fa fa-star'></i>" +
                    "</div>" +
                    "<div>" +
                      restaurants +
                    "</div>"

        $('#singleList').append(html);
      },
      error: function (resp) {
        console.log(resp);
      }
    });
  }

  getList();
});
