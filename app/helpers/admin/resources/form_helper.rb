module Admin::Resources::FormHelper

  def build_form(fields, form)
    String.new.tap do |html|
      fields.each do |key, value|
        value = :template if (template = @resource.typus_template(key))
        html << case value
                when :belongs_to
                  typus_belongs_to_field(key, form)
                when :tree
                  typus_tree_field(key, form)
                when :boolean, :date, :datetime, :text, :time, :password, :selector, :dragonfly, :paperclip
                  typus_template_field(key, value, form)
                when :template
                  typus_template_field(key, template, form)
                when :has_and_belongs_to_many
                  typus_has_and_belongs_to_many_field(key, form)
                else
                  typus_template_field(key, :string, form)
                end
      end
    end.html_safe
  end

  def typus_template_field(attribute, template, form)
    options = {
      start_year: @resource.typus_options_for(:start_year),
      end_year: @resource.typus_options_for(:end_year),
      minute_step: @resource.typus_options_for(:minute_step),
      include_blank: true,
      class: 'form-control',
    }

    label_text = @resource.human_attribute_name(attribute)

    locals = {
      resource: @resource,
      attribute: attribute,
      attribute_id: "#{@resource.table_name}_#{attribute}",
      options: options,
      html_options: {},
      form: form,
      label_text: label_text,
      help_block: help_block,
    }

    render "admin/templates/#{template}", locals
  end

  # Placeholder
  def help_block
    false
  end

  def build_save_options
    save_options_for_user_class || save_options_for_headless_mode || save_options
  end

  def save_options
    options = {}

    if admin_user.can?('create', @resource.model_name)
      options[:_addanother] = 'typus.buttons.save_addanother'
    end

    if admin_user.can?('edit', @resource.model_name)
      options[:_continue] = 'typus.buttons.save_continue'
    end

    options[:_save] = 'typus.buttons.save'

    options
  end

  def save_options_for_headless_mode
    return unless headless_mode?
    { _continue: 'typus.buttons.save' }
  end

  def save_options_for_user_class
    return unless defined?(Typus.user_class) && Typus.user_class == @resource && admin_user.is_not_root?
    { _continue: 'typus.buttons.save_continue' }
  end

end
