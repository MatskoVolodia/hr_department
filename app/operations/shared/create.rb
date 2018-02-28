module Shared
  class Create < ::Callable
    def initialize(params = {})
      @params = params[:params]
    end

    protected

    attr_reader :params
  end
end