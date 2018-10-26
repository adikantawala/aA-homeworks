class Queue

  attr_reader :underlying_array

  def initialize()
    @underlying_array = underlying_array
  end

  def enqueue(el)
    @underlying_array.unshift(el)
    el
  end

  def dequeue
    @underlying_array.pop
  end

  def peek
    @underlying_array.last
  end
end
