class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents

    #@pitch = Pitch.find(params[:pistaId])
    #@schedule = Schedule.where("date_ref = ? and pitch_id = ?", params[:fecha] , params[:pistaId])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @pitch.normal_price,
      :description => 'Reserva en '+ @pitch.name,
      :currency    => 'eur'
    )

    #@schedule.inspect
    #pitch.inspect
    #params.inspect

    #reservation = Reservation.create()

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

private
  def valid_selection?(values,pitch_id,date)
    schedule = Schedule.where("date_ref = ? and pitch_id = ?", date , pitch_id)
    array = values.split(",").map(&:to_i)
  end
