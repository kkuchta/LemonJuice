module AngelList
  JOBS_URL= 'https://api.angel.co/1/jobs'
  def AngelList.getJobs
    
    log = Rails.logger
    log.info "Importing from AngelList"

    last_page = 2
    page = 1
    until page >= last_page or page > 5
      url = JOBS_URL + '&page=' + page.to_s
      http_result = HTTParty.get(JOBS_URL)
      result = ActiveSupport::JSON.decode(http_result.body)
      last_page = result['last_page']
      
      log.info "Got results for page #{page} of #{last_page}"
      page = page + 1
    end

    return [Job.create({role:'foo'})]
  end
end
