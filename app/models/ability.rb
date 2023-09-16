class Ability
  include CanCan::Ability

  def initialize(user)
    # Assuming user is the currently logged-in user

    # Check if the user is logged in
    if user
      can :read, Category, user_id: user.id
      can :create, Category, user_id: user.id
      can :read, CashTracker, user_id: user.id
      can :create, CashTracker, user_id: user.id
    else
      cannot :read, Category
    end
  end
end
