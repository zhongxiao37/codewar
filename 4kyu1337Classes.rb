def leet_classes
  (1..1337).map do |i|
    klass = Class.new do
      define_method "unique_instance_method#{i}" do
        "i#{i}"
      end
    end
    klass.singleton_class.define_method "unique_class_method#{i}" do
      "c#{i}"
    end
    Object.const_set("Klass#{i}", klass)
    klass
  end  
end