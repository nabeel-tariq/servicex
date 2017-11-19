class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_employer

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = @employer.jobs.build(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to edit_employer_path(@employer,anchor: "jobs_tab"), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to edit_employer_path(@employer,anchor: "jobs_tab"), notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :description,:time, :status_id, :employer_id, :ad_type, :budget, service_ids: [],
                                  location_attributes: [:id, :name, :address_1, :address_2, :zip_code, :city_id, :longitude, :latitude],
                                  attachments_attributes: [:id, :name, :image_type, :document],
                                  jobs_services_attributes: [:id, :job_id, :service_id])
    end

  def set_employer
    @employer = current_user.profileable
  end
end
