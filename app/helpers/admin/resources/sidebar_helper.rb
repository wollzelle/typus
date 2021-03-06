module Admin::Resources::SidebarHelper

  def build_sidebar
    locals = { sidebar_title: t('typus.dashboard.title'), actions: []}

    if @resource
      locals[:actions] = [sidebar_list(@resource.name), sidebar_add_new(@resource.name)].compact
      locals[:sidebar_title] = @resource.model_name.human(count: 1_000)
    end

    render 'helpers/admin/resources/sidebar', locals
  end

  def sidebar_add_new(klass)
    return if admin_user.cannot?('create', klass)

    {
      message: t('typus.buttons.add'),
      url: { controller: "/admin/#{klass.to_resource}", action: 'new' },
      icon: 'plus',
    }
  end

  def sidebar_list(klass)
    return if admin_user.cannot?('read', klass)

    {
      message: t('typus.buttons.list'),
      url: { controller: "/admin/#{klass.to_resource}", action: 'index' },
      icon: 'list',
    }
  end

end
