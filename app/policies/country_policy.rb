class CountryPolicy < ApplicationPolicy
  def index?
    return false unless user

    user.admin? || user.editor?
  end

  def new?
    create?
  end

  def create?
    return false unless user

    user.admin?
  end

  def edit?
    update?
  end

  def update?
    return false unless user

    user.admin?
  end

  def destroy?
    return false unless user

    user.admin?
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
