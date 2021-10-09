class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    @tail.next_node = new_node if @tail
    @tail = new_node
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    temp = @head
    count = 0
    until temp.nil?
      count += 1
      temp = temp.next_node
    end
    count
  end

  # head and tail methods redundant as they can be accessed via attr_reader

  # def head
  #   @head
  # end

  # def tail
  #   @tail
  # end

  def at(index)
    temp = @head
    count = 0
    until temp.nil?
      return temp if count == index

      count += 1
      temp = temp.next_node
    end
  end

  def pop
    nil if size < 1
    temp = @head
    temp = temp.next_node until temp.next_node == @tail
    temp.next_node = nil
    @tail = temp
  end

  # def contains?(value)
  #   @arr.any?(value)
  # end

#   def find(value)
#     @arr.index(value)
#   end

  class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

end

list = LinkedList.new
list.append(3)
list.append(2)
list.append(1)
list.prepend(4)

# p list.head
# p list.tail
# p list
# p list.size
#p list
p list.at(5)
# p list.head.next_node
# p list.tail.next_node
p list.tail
p list.pop
p list