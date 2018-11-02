class LRUCache
  def initialize(size)
    @cache = []
    @size = size

  end

  def count
    return @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif @cache.length >= @size
      @cache.push(el)
      @cache.shift
    else
      @cache << el
    end
  end

  def show
    p @cache
    nil
  end

  private
  # helper methods go here!

end
