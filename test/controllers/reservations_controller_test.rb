require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = FactoryGirl.build(:reservation)
  end

  test 'should get index' do
    get reservations_url
    assert_response :success
  end

  test 'should get new' do
    get new_reservation_url
    assert_response :success
  end

  test 'should create reservation' do
    assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { end_date: @reservation.end_date, start_date: @reservation.start_date, room_id: @reservation.room.id } }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test 'should show reservation' do
    @reservation.save
    get reservation_url(@reservation)
    assert_response :success
  end

  test 'should get edit' do
    @reservation.save
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test 'should update reservation' do
    @reservation.save
    patch reservation_url(@reservation), params: { reservation: { end_date: @reservation.end_date, start_date: @reservation.start_date, room_id: @reservation.room.id } }
    assert_redirected_to reservation_url(@reservation)
  end

  test 'should destroy reservation' do
    @reservation.save
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
