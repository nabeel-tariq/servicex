module ContractorsHelper
  def bidding_handler user, job
    biddings = user.contractor.job_biddings(job)
    model = biddings.length > 0 ? biddings.first : Bidding.new
    model
  end
end
