class Stack
  # Last In First Out
  attr_reader :store
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    @store.pop
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
