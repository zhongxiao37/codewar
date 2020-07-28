# imported to handle any plural/singular conversions
require 'active_support/core_ext/string'

module InstanceEach
  def each(&block)
    self.size.times { |i| self[i].instance_eval &block }
    self
  end
end

class Thing
  attr_reader :name

  def initialize(name)
    @name = name
    @attr_dict = {}
  end

  def is_a
    @set_true = true
    self
  end

  def is_not_a
    @set_false = true
    self
  end

  def is_the
    @set = true
    self
  end

  alias_method :being_the, :is_the
  alias_method :and_the, :is_the

  def has(n)
    @has = true
    @cnt = n
    self
  end

  alias_method :having, :has

  def can
    @can = true
    self
  end

  def method_missing(m, *args, &block)
    if @set_true || @set_false || @set || @has || @can
      @attr_dict[m] = true if @set_true
      @attr_dict[m] = false if @set_false
      if @has
        @attr_dict[m] = @cnt > 1 ? Array.new(@cnt) { Thing.new(m.to_s.singularize) }.extend(InstanceEach) : Thing.new(m.to_s.singularize)
        @has = nil
        return @attr_dict[m]
      end

      if @can
        self.singleton_class.define_method(m) do |v|
          if args[0]
            @attr_dict[args[0].to_sym] ||= []
            @attr_dict[args[0].to_sym] << (instance_exec v, &block)
          end
          instance_exec v, &block
        end
      end

      # reset set flag
      @set_true = nil
      @set_false = nil
      @can = nil

      if @set
        if @set_key
          @attr_dict[@set_key] = m.to_s
          @set = nil
          @set_key = nil
        else
          @set_key = m
        end
      end
      return self
    end
    return @name == Regexp.last_match[1] || @attr_dict.fetch(Regexp.last_match[1].to_sym, false) if m =~ /\A([a-z_]+)\?\z/

    @attr_dict.fetch(m, nil)
  end
end