class ContractorServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  # GET /contractors
  # GET /contractors.json
  def index
    @contractors = ContractorService.all
  end

  # GET /contractors/1
  # GET /contractors/1.json
  def show
  end

  # GET /contractors/new
  def new
    @contractor_service = ContractorService.new
  end

  # GET /contractors/1/edit
  def edit
    # @contractor.initialize_nested
  end

  # POST /contractors
  # POST /contractors.json
  def create
    service_ids = params[:service_ids] if params[:service_ids].present?
    service_ids.each do |service_id|
      ContractorService.create(contractor_id: params[:contractor_service][:contractor_id],service_id: service_id)
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Contractor was successfully created.' }
    end
  end

  # PATCH/PUT /contractors/1
  # PATCH/PUT /contractors/1.json
  def update
    respond_to do |format|
      if @contractor_service.update(contractor_params)
        @contractor_service.locations.build
        format.js { render "update" }
        format.html { redirect_to edit_contractor_path, notice: 'Contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @contractor_service }
      else
        format.html { render :edit }
        format.json { render json: @contractor_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1
  # DELETE /contractors/1.json
  def destroy
    @contractor_service.destroy
    respond_to do |format|
      format.html { redirect_to contractors_url, notice: 'Contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor_service = ContractorService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor_service).permit(:id,locations_attributes: [:name, :radius,:latitude,:longitude,:id])
    end
end
