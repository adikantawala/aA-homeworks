class Map

  def initialize
    @arr = []
  end
  def set(key, value)
    check = false
    @arr.each do |subarr|
      if subarr.include?(key)
        subarr[key] = value
        check = true
      end
    end
    arr << [key,value]if check
  end

  def get(key)
    @arr.each do |subarr|
      return subarr if subarr.include?(key)
    end
    return nil
  end
  def delete(key)
    @arr.each do |subarr|
      @arr.delete(subarr)if subarr.include? key
    end
  end
  def show
    @arr
  end
end
