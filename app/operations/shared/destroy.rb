module Shared
  class Destroy < ::Callable
    def initialize(params = {})
      @item = params[:item]
    end

    def call
      item.destroy
    end

    private

    attr_reader :item
  end
end
