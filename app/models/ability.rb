class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Post do |p|
        Post.readable(user).include?(p)
      end

      can :update, User, id: user.id
    end
  end
end
