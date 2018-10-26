require "byebug"
class Map

  def initialize
    @arr = []
  end
  def set(key, value)
    check = true
    @arr.each do |subarr|
      if subarr.include?(key)
        subarr[-1] = value
        check = false
      end
    end
    # byebug
    @arr << [key,value] if check
    [key,value]
  end

  def get(key)
    @arr.each do |subarr|
      return subarr if subarr.include?(key)
    end
    return nil
  end
  def delete(key)
    @arr.each do |subarr|
      @arr.delete(subarr)if subarr.include?(key)
      return subarr
    end
  end
  def show
    @arr
  end
end
