require 'wonolo/request'
require 'wonolo/connection'

module Wonolo
  # base class that will be inherited by all wonolo services
  class Base
    attr_accessor :errors

    PER_PAGE = 10
    def initialize(args = {})
      args.each do |name, value|
        attr_name = name.to_s.underscore
        send("#{attr_name}=", value) if respond_to?("#{attr_name}=")
      end
    end
  end
end
