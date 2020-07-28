module Enumerable
  def accumulate(*args, &block)
    raise Error if args.size > 2
    raise Error if args.any?(&:nil?)
    raise Error if args.size == 1 && args[-1].to_s == '*'
    if args[-1]&.respond_to?(:to_proc) && !args[-1].is_a?(Hash)
      old_block = block if block_given?
      block = args.pop.to_proc
    end
    default = args.pop if args[0]
    return nil if old_block && default.nil?
    
    
    each do |element, index|
      if default.nil?
        default = element
      else
        default = block.call(default, index.nil? ? element : [element, index])
      end
    end
    default
  end
end