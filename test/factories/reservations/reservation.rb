FactoryGirl.define do
  factory :reservation, class: Reservation do
    room
    start_date DateTime.new(2022, 0o2, 0o1, 10, 0o0, 0)
    end_date DateTime.new(2022, 0o2, 0o1, 11, 0o0, 0)
  end
end
