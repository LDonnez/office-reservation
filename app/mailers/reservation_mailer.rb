class ReservationMailer < ApplicationMailer
  default from: 'example@example.com'

  def email(to: user, reservation: reservation)
    @user = to
    @reservation = reservation
    mail(to: @user.email, subject: "#{@reservation.room.name} successfully booked")
  end
end
