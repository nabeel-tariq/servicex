class ContractorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = Contractor.all
  end

  # GET /contractors/1
  # GET /contractors/1.json
  def show
  end

  # GET /contractors/new
  def new
    @contractor = Contractor.new
  end

  # GET /contractors/1/edit
  def edit
    # @contractor.initialize_nested
  end

  # POST /contractors
  # POST /contractors.json
  def create
    @contractor = Contractor.new(contractor_params)

    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: 'Contractor was successfully created.' }
        format.json { render :show, status: :created, location: @contractor }
      else
        format.html { render :new }
        format.json { render json: @contractor.errors, status: :unprocessaservice_idble_entity }
      end
    end
  end

  # PATCH/PUT /contractors/1
  # PATCH/PUT /contractors/1.json
  def update
    respond_to do |format|
      if @contractor.update(contractor_params)
        @contractor.user.complete!
        format.html { redirect_to edit_contractor_path, notice: 'Contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @contractor }
      else
        format.html { render :edit }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.json
  def destroy
    @contractor.destroy
    respond_to do |format|
      format.html { redirect_to contractors_url, notice: 'Contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor = Contractor.find(params[:id])
      @technician = Technician.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor).permit(:first_name, :last_name, :shop_name, :is_active,
                                         contact_numbers_attributes: [ :id, :text_value ],
                                         location_attributes: [:id, :name, :radius, :address_1, :address_2, :zip_code, :city_id, :longitude, :latitude,
                                         contact_numbers_attributes: [ :id, :text_value ]],
                                         attachments_attributes: [:id, :name, :image_type, :document],
                                         contractor_services_attributes: [:id, :contractor_id, :service_id, locations_attributes: [:id, :name, :address_1, :address_2, :zip_code, :city_id, :longitude, :latitude ]])
    end
end
