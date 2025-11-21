module FlashHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
    when :warning then "alert alert-warning"
    end
  end

  def flash_icon(level)
    case level.to_sym
    when :notice then "ti ti-info-circle"
    when :success then "ti ti-check"
    when :error then "ti ti-alert-triangle"
    when :alert then "ti ti-alert-circle"
    when :warning then "ti ti-alert-circle"
    end
  end
end
