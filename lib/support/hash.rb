class Hash

  def cleanup_blank
    delete_if { |k, v| v.blank? }
  end

  def cleanup
    whitelist = %w(controller action id _input _popup resource attribute)
    delete_if { |k, v| !whitelist.include?(k) }
  end

end
