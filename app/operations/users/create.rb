module Users
  class Create < Shared::Create
    def call
      User.new(params).tap(&:save)
    end
  end
end
