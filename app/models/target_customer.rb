class TargetCustomer < ApplicationRecord
  default_scope { order(gender: :asc, min_age: :asc) }
end
