module AngelList
  JOBS_URL= 'https://api.angel.co/1/jobs'
  def AngelList.getJobs
    
    log = Rails.logger
    log.info "Importing from AngelList"

    last_page = 2
    page = 1
    until page >= last_page or page > 3
      url = "#{JOBS_URL}?page=#{page}&per_page=3"
      log.info url.inspect
      response = HTTParty.get(url)
      page_json = ActiveSupport::JSON.decode(response.body)
      last_page = page_json['last_page']
      
      log.info "Got results for page #{page} of #{last_page}"

      page_json['jobs'].each do |job|
        log.info "Got title " + job['title']

        #response = HTTParty.get( "#{JOBS_URL}/#{job['id']}" );
        #job_json = ActiveSupport::JSON.decode( response.body )
        
        job_data = {
          title: job['title'],

        }
      end

      page = page + 1
    end

    return [
      {
        title: "Some job title",
        job: {
          role: "developer"
        }
      }
    ]
  end
end
