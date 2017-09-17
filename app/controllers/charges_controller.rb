class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents

    @pitch = Pitch.find

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @pitch.normal_price,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
