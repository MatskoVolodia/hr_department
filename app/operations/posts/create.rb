module Posts
  class Create < Shared::Create
    def call
      Post.new(params).tap(&:save)
    end
  end
end