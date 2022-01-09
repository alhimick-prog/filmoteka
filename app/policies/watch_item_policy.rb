class WatchItemPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    return false unless user

    user.id == record.user_id
  end

  def update?
    return false unless user

    user.id == record.user_id
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
