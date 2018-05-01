module Wonolo
  class JobsController < ApplicationController

    def index
      @page = params[:page] || '1'
      @request_name = params[:name]
      request_id = params[:request_id]
      @jobs = Wonolo::Job.find(@page, request_id)
    end
  end
end
