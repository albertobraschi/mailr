module NavigationHelper
  def link_back_to_messages
    link_to("&#171;" << _('Back to messages'), :controller=>"webmail", :action=>"messages")
  end

  def link_send_mail
    link_to(_('Compose'), :controller=>"webmail", :action=>"compose")
  end

  def link_mail_prefs
    link_to(_('Preferences'), :controller=>"webmail", :action=>"prefs")
  end

  def link_mail_filters
    link_to(_('Filters'), :controller=>"webmail", :action=>"filters")
  end

  def folder_manage_link(folder)
    if folder.name == CDF::CONFIG[:mail_trash] or folder.name == CDF::CONFIG[:mail_inbox] or folder.name == CDF::CONFIG[:mail_sent]
      short_fn(folder)
    else
      short_fn(folder) + '&nbsp;' + link_to(_('Delete'), folder_path(folder.name), :method => :delete)
    end  
  end

  def link_import_preview() "/contacts/import_preview" end
  def link_main_index() "/" end
  def link_contact_import() "/contacts/import" end
  def link_contact_choose() "/contacts/contact/choose" end

  def link_contact_list
    link_to(_('List'), :controller => "/contacts/contact", :action => "list") 
  end

  def link_contact_add_one
    link_to(_('Add one contact'), new_contact_path)
  end

  def link_contact_add_multiple
    link_to(_('Add multiple'), :controller => "/contacts/contact", :action => "add_multiple") 
  end
  
  def link_contact_group_list 
    link_to(_('Groups'), :controller => "/contacts/contact_group", :action => "list") 
  end

  def link_folders
    link_to(_('Folders'), :controller=>"/webmail", :action=>"messages")
  end
  
  def link_send_mail
    link_to(_('Compose'), :controller=>"/webmail", :action=>"compose")
  end

  def link_mail_prefs
    link_to(_('Preferences'), :controller=>"/webmail", :action=>"prefs")
  end
  
  def link_mail_filters
    link_to(_('Filters'), :controller=>"/webmail", :action=>"filters")
  end

  private

  def short_fn(folder)
    if folder.name.include? folder.delim
      "&nbsp; &nbsp;" + folder.name.split(folder.delim).last
    else
      folder.name
    end
  end
end
