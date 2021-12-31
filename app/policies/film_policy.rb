class FilmPolicy < ApplicationPolicy
  def show?
    user.admin? || user.id == record.creator_id || record.approved?
  end

  def new?
    user.admin? || user.editor?
  end

  def create?
    user.admin? || user.editor?
  end
  
  def edit?
    user.admin? || user.editor? && record.creator_id == user.id
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
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(published: true)
      # end
      #scope.where(creator_id: 123, approved: false)
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
