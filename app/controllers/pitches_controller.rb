class PitchesController < ApplicationController
  before_action :set_pitch, only: [:show, :edit, :update, :destroy]

  # GET /pitches
  # GET /pitches.json
  def index
    @pitches = Pitch.all
  end

  # GET /pitches/1
  # GET /pitches/1.json
  def show
    @city = Institution.find_by_id(params[:institution_id])
  end

  # GET /pitches/new
  def new
    @pitch = Pitch.new
  end

  # GET /pitches/1/edit
  def edit
  end

  # POST /pitches
  # POST /pitches.json
  def create
    @pitch = Pitch.new(pitch_params)

    respond_to do |format|
      if @pitch.save
        format.html { redirect_to @pitch, notice: 'Pitch was successfully created.' }
        format.json { render :show, status: :created, location: @pitch }
      else
        format.html { render :new }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pitches/1
  # PATCH/PUT /pitches/1.json
  def update
    respond_to do |format|
      if @pitch.update(pitch_params)
        format.html { redirect_to @pitch, notice: 'Pitch was successfully updated.' }
        format.json { render :show, status: :ok, location: @pitch }
      else
        format.html { render :edit }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitches/1
  # DELETE /pitches/1.json
  def destroy
    @pitch.destroy
    respond_to do |format|
      format.html { redirect_to pitches_url, notice: 'Pitch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_schedule
    # Improvement: manage the picker to send the correct format -> DatePicker altformat
    our_date = Date.strptime(params[:day], '%d/%m/%Y')
    @schedule = Schedule.where("date_ref = ? and pitch_id = ?", our_date , params[:pitch_id])
    render json: @schedule[0]
  end

  def summary
    @selection = params[:globalJSON]
  end

  def confirmation

  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_pitch
      @pitch = Pitch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pitch_params
      params.require(:pitch).permit(:name, :normal_price, :special_price, :active, :kind, :other, :image1, :image2, :image3, :institution_id)
    end
end
