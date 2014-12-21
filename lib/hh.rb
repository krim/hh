#encoding: utf-8

require 'hh/version'
require 'faraday'
require 'faraday_middleware'

module HH
  class << self

    # Alias for Hh::Client.new
    #
    # @return [Hh::Client]
    def client
      HH::Client.new
    end

    # Delegate to HH::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end #HH

require 'hh/API/employer_vacancies'
require 'hh/API/specialization'
require 'hh/API/employment'
require 'hh/API/statistic'
require 'hh/API/schedule'
require 'hh/API/currency'
require 'hh/API/employer'
require 'hh/API/vacancy'
require 'hh/API/region'
require 'hh/API/metro'
require 'hh/API/industries'
require 'hh/API/dictionaries'
require 'hh/api'
require 'hh/request'
require 'hh/client'
