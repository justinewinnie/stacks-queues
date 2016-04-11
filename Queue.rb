class Queue
  # First In First Out
  attr_accessor :store
  def initialize
    @store = Array.new
  end

  def dequeue
    grab = @store[0]
    @store = @store.drop(1)
    grab
  end

  def enqueue(element)
    @store << element
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end

  def to_s
    @store.to_s
  end
end
