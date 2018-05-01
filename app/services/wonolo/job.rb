module Wonolo
  # Job details of Job requests that were approved and perfrom by wonoloers
  class Job < Base
    attr_accessor :finished_at,
                  :w2_hourly_rate,
                  :worker,
                  :employer

    def initialize(args = {})
      super(args)
      self.worker = parse_worker(args)
      self.employer = parse_employer(args)
    end

    def self.find(page, request_id)
      Rails.cache.fetch("/wonolo/jobs/#{request_id}_#{page}", expires_in: 100.days) do
        response = Request.get('jobs', { job_request_id: request_id,
                                         page: page,
                                         per: PER_PAGE
                                        })
        response['jobs'].map { |job| Job.new(job) }
      end
    end

    def parse_worker(args = {})
      User.new(args['worker']) if args['worker']
    end

    def parse_employer(args = {})
      User.new(args['employer']) if args['employer']
    end
  end
end
