module Wonolo
  class JobRequestsController < ApplicationController

    def index
      @page = params[:page] || '1'
      @job_requests = Wonolo::JobRequest.list(@page)
    end
  end
end
