$(document).on "page:change", ->
  $('#button').click ->
    <%= flash[:alert] = "Hi" %>
# // var ourRequest = new XMLHttpRequest();
# // ourRequest.open('GET', 'app/views/date.html.erb');
# // ourRequest.onload = function() {
# //     var ourData = JSON.parse(ourRequest.responseText);
# //     console.log(ourData[0]);
# // };
# // ourRequest.send();