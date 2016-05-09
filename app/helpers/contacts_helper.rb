module ContactsHelper
  def contacts_new_or_edit
    if action_name == 'new'
      confirm_contacts_path 
    elsif action_name == 'edit'
      contact_path
    end
  end
end