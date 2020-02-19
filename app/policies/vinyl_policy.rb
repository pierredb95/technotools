class VinylPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.geocoded
    end
  end

  def new?
    user
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
