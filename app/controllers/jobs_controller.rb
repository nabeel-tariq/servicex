class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_employer, except: [:search_jobs]
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  # GET /jobs
  # GET /jobs.json
  def index
    #@jobs = Job.all
    smart_listing_create :jobs, current_user.employer.jobs, partial: "partials/bidding_job_listing"
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

  def delete_picture
    if params[:attachment_id]
      attachment = Attachment.find_by_id params[:attachment_id]
      attachment.destroy if attachment
    end
  end

  def search_jobs
    options = { sort: "jobs.updated_at desc", conditions: {status: 0},attachment_joins: {}, raw_conditions:[], not_conditions: {}, exclusive_conditions: {},
                joins: [:location,jobs_services: [:service]] }
    Job.set_search_params options, params
    if params[:open_text].present?
      search_results = Job.search_name(params[:open_text]).left_joins(options[:joins]).joins(options[:attachment_joins]).where(options[:conditions]).where(options[:raw_conditions])
    else
      search_results = Job.left_joins(options[:joins]).joins(options[:attachment_joins]).where(options[:conditions]).where(options[:raw_conditions])
    end

    @job_search_results = Kaminari.paginate_array(search_results).page(params[:page]).per(10)

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
    @employer = current_user.employer
  end
end