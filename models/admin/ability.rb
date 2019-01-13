module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      return unless user.admin?

      can :read, Order
      can :read, Trade
      can :read, Proof
      can :update, Proof
      can :manage, Document
      can :manage, Member
      can :manage, Ticket
      can :manage, IdDocument
      can :manage, TwoFactor

      can :menu, Deposit
      can :manage, ::Deposits::Bank
      can :manage, ::Deposits::Satoshi
      can :manage, ::Deposits::Zarbitfast
      can :manage, ::Deposits::Dogecoin
      can :manage, ::Deposits::Frostbyte
      can :manage, ::Deposits::Allsafe
      can :manage, ::Deposits::Blackcoin
      can :manage, ::Deposits::Litecoin
      can :manage, ::Deposits::Peercoin
      can :manage, ::Deposits::Realpointcoin
      can :manage, ::Deposits::Tritiumcoin

      can :menu, Withdraw
      can :manage, ::Withdraws::Bank
      can :manage, ::Withdraws::Satoshi
      can :manage, ::Withdraws::Zarbitfast
      can :manage, ::Withdraws::Dogecoin
      can :manage, ::Withdraws::Frostbyte
      can :manage, ::Withdraws::Allsafe
      can :manage, ::Withdraws::Blackcoin
      can :manage, ::Withdraws::Litecoin
      can :manage, ::Withdraws::Peercoin
      can :manage, ::Withdraws::Realpointcoin
      can :manage, ::Withdraws::Tritiumcoin
    end
  end
end
