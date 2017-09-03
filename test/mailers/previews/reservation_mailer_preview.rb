# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  def email_preview
    ReservationMailer.email(to: User.first, reservation: Reservation.first)
  end
end
