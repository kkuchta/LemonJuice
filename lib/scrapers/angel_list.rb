module AngelList
  JOBS_URL= 'https://api.angel.co/1/jobs'
  ROLE_MAP= {
    "developer" => "developer",
    "designer" => "designer",
    "sales" => "other",
    "product_manager" => "other",
    "marketing" => "other",
    "human_resources" => "other",
    "finance" => "other",
    "office_manager" => "other",
    "hardware_engineer" => "other"
  }
  def AngelList.getJobs
    
    log = Rails.logger
    log.info "Importing from AngelList"

    last_page = 2
    page = 1
    job_listing_data = []
    until page >= last_page or page > 1
      url = "#{JOBS_URL}?page=#{page}&per_page=3"
      #log.info url.inspect
      response = HTTParty.get(url)
      page_json = ActiveSupport::JSON.decode(response.body)
      last_page = page_json['last_page']
      
      log.info "Got results for page #{page} of #{last_page}"

      page_json['jobs'].each do |job|
        log.info "Got title " + job['title']
        #log.info "job = " + job.inspect

        skills = []
        location = nil
        role = nil
        job['tags'].each do |tag|
          case tag['tag_type']
            when 'SkillTag'
              skills.append tag['display_name']
            when 'LocationTag'
              location = tag['display_name']
            when 'RoleTag'

              # If multiple roles, assume developer
              if( role != 'developer' )
                role = ROLE_MAP[tag['name']]
                if role == nil
                  log.error "Invalid role " + tag['name'].to_s
                end
              end
          end
        end

        #response = HTTParty.get( "#{JOBS_URL}/#{job['id']}" );
        #job_json = ActiveSupport::JSON.decode( response.body )
        
        # we need to check for duplicates later, so just return json for now
        job_listing_data.append( {
          title: job['title'],
          description: skills.join(' - '),
          location_string: location,
          role: role,
          url: job['angellist_url'],
          company: job['startup']['name'],
          key_in_provider: job['id']
        } )
      end

      page = page + 1
    end

    return job_listing_data
  end
end
