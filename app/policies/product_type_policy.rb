class ProductTypePolicy < ApplicationPolicy
  def is_owner?
    is_admin?
  end
end
