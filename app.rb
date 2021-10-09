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

  def contains?(value)
    temp = @head
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    temp = @head
    count = 0
    until temp.nil?
      return count if temp.value == value

      count += 1
      temp = temp.next_node
    end
    nil
  end

  def to_s
    temp = @head
    string = ''
    until temp.nil?
      string += "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    string += 'nil'
    string
  end

  def insert_at(value, index)
    return puts 'Error: index outside of list.' if index > size - 1

    if index.zero?
      prepend(value) 
    else
      new_node = Node.new(value)
      temp = @head
      count = 0
      until temp.nil?
        if count == index - 1
          new_node.next_node = temp.next_node
          temp.next_node = new_node
        end
        count += 1
        temp = temp.next_node
      end
    end
    @tail = new_node if new_node.next_node.nil?
  end

  def remove_at(index)
    return puts 'Error: index outside of list.' if index > size - 1

    if index.zero?
      @head = temp.next_node
    elsif at(index) == @tail
      @tail = at(index - 1)
      @tail.next_node = nil
    else
      temp = @head
      count = 0
      until temp.nil?
        temp.next_node = temp.next_node.next_node if count == index - 1
        count += 1
        temp = temp.next_node
      end
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
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
p list.size
# p list
# p list.at(5)
# p list.head.next_node
# p list.tail.next_node
# p list.tail
# p list.pop
# p list.contains?(1)
# p list.find(2)
# puts list.to_s
list.insert_at('foo', 3)
puts list.to_s
list.remove_at(1)
puts list.to_s
puts list.tail.value
puts list.to_s
list.remove_at(3)
puts list.to_s