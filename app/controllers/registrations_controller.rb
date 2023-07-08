class RegistrationsController < Devise::RegistrationsController
  include Devise::Controllers::Helpers
  before_action :set_minimum_password_length, only: [:new]

  # Add any additional actions or customizations here

  def set_minimum_password_length
    if devise_mapping.validatable?
      @minimum_password_length = resource_class.password_length.min
    end
  end
end
