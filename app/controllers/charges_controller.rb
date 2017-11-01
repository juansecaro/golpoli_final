class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    # Amount in cents
    @pitch = Pitch.find(params[:pistaId])
    @schedule = Schedule.where("date_ref = ? and pitch_id = ?", params[:fecha], params[:pistaId]).first
    #@schedule = Schedule.where("date_ref = ? and pitch_id = ?", params[:fecha] , params[:pistaId])

    if valid_selection?(params[:selections])

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @pitch.price_in_cents,# por el número de selecc!!
        :description => 'Reserva en ', #+ @pitch.name +' '+  ,
        :currency    => 'eur'
      )

      reservation = Reservation.create(
        institution_id: @pitch.institution_id,
        pitch_id: @pitch.id,
        #user_id: current_user.email,
        amount: params[:amount],
        charge_id: charge.id,
        selected_date: params[:fecha],
        time_selections: params[:selections],
        fingerprint: params[:stripeToken]
        )

      block_selected_hours(params[:selections])
      redirect_to reservation

  else
    flash[:error] = "Alguien ha cerrado una reserva con estos datos invalidando la tuya. Inténtalo de nuevo"
    redirect_to root
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

private

  # def not_so_valid_selection?(values,pitch_id,date)
  #   if schedule = Schedule.where(date_ref: date, pitch_id: pitch_id).first
  #     values.split(',').map(&:to_i).all?{|v| schedule.send("h#{v}") == 0}
  #   else
  #     false
  #   end
  # end
  def block_selected_hours(values)

    array = values.split(",").map(&:to_i)
    for i in array do
      @schedule.write_attribute("h#{i}", 1)
    end
    @schedule.save

  end

  def valid_selection?(values)

    return false if @schedule == nil # No result

    # We assume validity until opposite is proven
    validity = true

    scheduleArray = Array.new
    scheduleArray[0] = @schedule.h0
    scheduleArray[1] = @schedule.h1
    scheduleArray[2] = @schedule.h2
    scheduleArray[3] = @schedule.h3
    scheduleArray[4] = @schedule.h4
    scheduleArray[5] = @schedule.h5
    scheduleArray[6] = @schedule.h6
    scheduleArray[7] = @schedule.h7
    scheduleArray[8] = @schedule.h8
    scheduleArray[9] = @schedule.h9

    scheduleArray[10] = @schedule.h10
    scheduleArray[11] = @schedule.h11
    scheduleArray[12] = @schedule.h12
    scheduleArray[13] = @schedule.h13
    scheduleArray[14] = @schedule.h14
    scheduleArray[15] = @schedule.h15
    scheduleArray[16] = @schedule.h16
    scheduleArray[17] = @schedule.h17
    scheduleArray[18] = @schedule.h18
    scheduleArray[19] = @schedule.h19

    scheduleArray[20] = @schedule.h20
    scheduleArray[21] = @schedule.h21
    scheduleArray[22] = @schedule.h22
    scheduleArray[23] = @schedule.h23
    scheduleArray[24] = @schedule.h24
    scheduleArray[25] = @schedule.h25
    scheduleArray[26] = @schedule.h26
    scheduleArray[27] = @schedule.h27
    scheduleArray[28] = @schedule.h28
    scheduleArray[29] = @schedule.h29

    scheduleArray[30] = @schedule.h30
    scheduleArray[31] = @schedule.h31
    scheduleArray[32] = @schedule.h32
    scheduleArray[33] = @schedule.h33
    scheduleArray[34] = @schedule.h34
    scheduleArray[35] = @schedule.h35
    scheduleArray[36] = @schedule.h36
    scheduleArray[37] = @schedule.h37
    scheduleArray[38] = @schedule.h38
    scheduleArray[39] = @schedule.h39

    scheduleArray[40] = @schedule.h40
    scheduleArray[41] = @schedule.h41
    scheduleArray[42] = @schedule.h42
    scheduleArray[43] = @schedule.h43
    scheduleArray[44] = @schedule.h44
    scheduleArray[45] = @schedule.h45
    scheduleArray[46] = @schedule.h46
    scheduleArray[47] = @schedule.h47

    array = values.split(",").map(&:to_i)

    for i in array do
      validity = false if scheduleArray[i] != 0
    end

    return validity

  end
