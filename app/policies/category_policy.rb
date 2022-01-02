class CategoryPolicy < ApplicationPolicy
  def index?
    user.admin? || user.editor?
  end

  def new?
    create?
  end

  def create?
    user.admin? || user.editor?
  end
  
  def edit?
    update?
  end

  def update?
    user.admin? || user.editor? && record.creator_id == user.id
  end

  def destroy?
    user.admin? || user.editor? && record.creator_id == user.id
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
