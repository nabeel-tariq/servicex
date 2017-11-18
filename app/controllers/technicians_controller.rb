class TechniciansController < ApplicationController
  before_action :set_technician, only: [:show, :edit, :update, :destroy]

  # GET /technicians
  # GET /technicians.json
  def index
    @technicians = Technician.all
  end

  # GET /technicians/1
  # GET /technicians/1.json
  def show
  end

  # GET /technicians/new
  def new
    @technician = Technician.new
  end

  # GET /technicians/1/edit
  def edit
  end

  # POST /technicians
  # POST /technicians.json
  def create
    @technician = Technician.new(technician_params)

    respond_to do |format|
      if @technician.save
        format.html { redirect_to edit_contractor_path @technician.contractor, notice: 'Technician was successfully created.' }
        format.json { render :show, status: :created, location: @technician }
      else
        format.html { render :new }
        format.json { render json: @technician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technicians/1
  # PATCH/PUT /technicians/1.json
  def update
    respond_to do |format|
      if @technician.update(technician_params)
        format.html { redirect_to @technician, notice: 'Technician was successfully updated.' }
        format.json { render :show, status: :ok, location: @technician }
      else
        format.html { render :edit }
        format.json { render json: @technician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technicians/1
  # DELETE /technicians/1.json
  def destroy
    @technician.destroy
    respond_to do |format|
      format.js { render "destroy" }
      format.html { redirect_to technicians_url, notice: 'Technician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technician
      @technician = Technician.find(params[:id])
      @contractor = @technician.contractor if @technician.contractor
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technician_params
      params.require(:technician).permit(:id, :first_name, :last_name, :contractor_id,:is_active, contact_numbers_attributes: [ :id, :text_value ], location_attributes: [:id, :name, :address_1, :address_2, :zip_code, :city_id, :longitude, :latitude], attachments_attributes: [:id, :name, :image_type, :document])
    end
end
