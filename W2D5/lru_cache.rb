class LRUCache
  def initialize(size)
    @cache = []
    @size = size

  end

  def count
    return @cache.length
  end

  def add(el)
    if @cache.length > @size
      @cache.push(el)
      @cache.shift
    end
  end

  def show
    return @cache
  end

  private
  # helper methods go here!

end
