class FilmPolicy < ApplicationPolicy
  def show?
    return true if record.approved? && !user
    user.admin? || user.id == record.creator_id || record.approved?
  end

  def new?
    create?
  end

  def create?
    return false unless user
    user.admin? || user.editor?
  end
  
  def edit?
    update?
  end

  def update?
    return false unless user
    user.admin? || user.editor? && record.creator_id == user.id
  end

  def destroy?
    return false unless user
    user.admin? || user.editor? && record.creator_id == user.id
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      return scope.where(approved: true) unless user
      if user.admin?
        scope.all
      elsif user.editor?
        scope.where('approved = true or creator_id = ?', user.id)
      else
        scope.where(approved: true)
      end
    end

    private

    attr_reader :user, :scope
  end
end
