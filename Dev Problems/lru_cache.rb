class Cache

  def initialize(args)
    @max_size = args[:max_size]
    @cache = Hash.new
  end

  def write(key, value)
    if self.count < @max_size
      @cache[key] = value
    else
      key_to_delete = @cache.keys[0]
      @cache.delete(key_to_delete) unless @cache.has_key?(key)
      @cache[key] = value
    end
  end

  def read(key)
    value = @cache[key]
    unless value.nil?
      @cache.delete(key)
      @cache[key] = value 
    end
  end

  def delete(key)
    @cache.delete(key)
  end

  def clear
    size = self.count
    @cache.clear
    size
  end

  def count
    @cache.length
  end

  def to_h
    @cache
  end
end