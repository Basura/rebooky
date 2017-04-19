class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def create?
    owner_or_admin?
  end

  def new?
    true
  end

  def owner_or_admin?
    user.admin?
  end
end
