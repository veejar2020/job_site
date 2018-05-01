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
      Rails.cache.fetch("/wonolo/job_requests/#{page}", expires_in: 12.hours) do
        response = Request.get('job_requests', { state: 'approved',
                                                 page: page,
                                                 per: PER_PAGE
                                                })
        response['job_requests'].map { |job_req| JobRequest.new(job_req) }
      end
    end
  end
end
