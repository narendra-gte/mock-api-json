class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    #raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    logged_in?
  end

  def show?
    scope.where(:id => record.id).exists? 
  end

  def create?
    logged_in?
  end

  def new?
    create?
  end

  def update?
    is_owner? #|| is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    is_owner? #|| is_admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def is_owner?
    user == record.business_id
  end

  def is_admin?
    false
    #!user.nil? && user.admin?
  end

  def logged_in?
    !user.nil?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
