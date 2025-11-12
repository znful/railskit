module MemberHelper
  def can_edit_member?(member, member_account_user, current_account_user)
    return false if Current.user == member && !current_account_user.owner_role?

    return false if Current.user != member && member_account_user.owner_role?

    return true if current_account_user.owner_role? || current_account_user.admin_role?

    false
  end
end
