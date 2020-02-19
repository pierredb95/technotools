class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
    # user.bookings.include?(@booking)
  end

  def create?
    true
  end

  def update?
    record.booking.user == user
  end

  def destroy?
    record.user == user
  end
end
