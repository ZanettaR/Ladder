module TagValidationHelper
  extend ActiveSupport::Concern

  def sanatize_name
    self.name.try(:strip!)
  end
end
