module RoleHelper
  def role_options
    AccountUser.roles.keys.map { |role| [ role.humanize.titleize, role ] }
  end
end
