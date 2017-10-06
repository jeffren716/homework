class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.any? { |pair| pair[0] == key }
      @map.each { |pair| pair[-1] = value if pair[0] == key }
    else
      @map << [key, value]
    end
    [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      return pair[-1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    @map.reject! do |pair|
      pair[0] == key
    end
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
