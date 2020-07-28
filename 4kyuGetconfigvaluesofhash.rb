class Hash
  def get_value( default, *args )
    return default if args.empty?
    value = self
    while args.size > 0
      key = args.shift
      if value.respond_to?(:fetch)
        value = value.fetch(key, nil)
      else
        value = nil
        break
      end
    end
    value || default
  end
end