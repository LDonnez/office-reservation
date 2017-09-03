function init() {
  initializeRoomsSelector()
}

function initializeRoomsSelector() {
  $( "#reservation_room_id" ).select2({
    theme: 'bootstrap',
    width: 'parent'
  });
}

$(document).on('turbolinks:load', init);
