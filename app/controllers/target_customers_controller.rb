class TargetCustomersController < ApplicationController
  def index
    @target_customers = TargetCustomer.all
  end
end
