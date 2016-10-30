class Ability
  include CanCan::Ability

      def initialize(user)
        if user.propietario?          
              can :read, Proyecto
              can :create, Proyecto
              can :update, Proyecto do |proyecto|
                proyecto.try(:user) == user
              end
              can :destroy, Proyecto do |proyecto|
                proyecto.try(:user) == user
              end
        end
      end
end
