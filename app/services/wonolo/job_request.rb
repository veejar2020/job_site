module Wonolo
  # Job requests that were approved
  class JobRequest < Base
    attr_accessor :request_name,
                  :id,
                  :description,
                  :classification,
                  :wage,
                  :start_time,
                  :duration,
                  :address,
                  :city

    def self.list(page)
      response = Request.get('job_requests', { state: 'approved',
                                               page: page,
                                               per: PER_PAGE
                                              })
      response['job_requests'].map { |job_req| JobRequest.new(job_req) }
    end
  end
end
