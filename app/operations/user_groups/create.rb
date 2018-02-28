module UserGroups
  class Create < Shared::Create
    def call
      UserGroup.new(params).tap(&:save)
    end
  end
end
