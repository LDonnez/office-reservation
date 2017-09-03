json.extract! reservation, :id, :start_date, :end_date
json.title reservation.room.name
json.start reservation.start_date
json.end reservation.end_date
json.url reservation_path(reservation)
