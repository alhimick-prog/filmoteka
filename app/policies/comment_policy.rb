class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    create?
  end

  def create?
    return false unless user

    true
  end

  def destroy?
    return false unless user

    user.admin? || (user.id == record.user_id)
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
