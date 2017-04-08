# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user)
      end
    end
  end

  def permitted_attributes
    permitted = %i(first_name last_name contact_number email
                   password password_confirmation)
    permitted.concat([:role]) if user.admin?
    permitted
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    self_or_admin?
  end

  def destroy?
    self_or_admin?
  end

  def update?
    self_or_admin?
  end

  def self_or_admin?
    record.id == user.id || user.admin?
  end
end
