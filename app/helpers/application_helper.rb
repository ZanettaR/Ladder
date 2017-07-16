module ApplicationHelper
  def error_class_for(attribute)
    has_error_for(attribute) ? 'has-error' : ''
  end

  def controller_id
    t("#{controller_path.gsub(/\//,'.')}.alias", default: controller_name.gsub(/_/,'-'))
  end

  def page_id
    if [:new, :create, :edit, :update, :show, :destroy].include?(action_name.to_sym)
      "page-default"
    else
      "page-#{action_name.gsub(/_/,'-')}"
    end
  end
end
