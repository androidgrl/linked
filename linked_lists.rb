class IterativeLinkedList
  attr_reader :head

  def initialize(head=nil)
    @head = head
  end


  def append(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      current_node = head
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node.next_node = node
    end
  end

  def count
    if head.nil?
      0
    elsif head.next_node.nil?
      1
    else
      current_node = head
      count = 1
      while current_node.next_node
        count += 1
        current_node = current_node.next_node
      end
      count
    end
  end

  def tail
    if head.nil?
      nil
    elsif head.next_node.nil?
      head.next_node
    else
      current_node = head
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node
    end
  end

  def pop
    if head.nil?
      nil
    elsif head.next_node.nil?
      head.data
    else
      current_node = head
      while current_node.next_node.next_node
        current_node = current_node.next_node
      end
      last_node = current_node.next_node
      current_node.next_node = nil
      last_node.data
    end
  end

  def access(index)
    if head.nil?
      nil
    elsif head.next_node.nil?
      head.data
    else
      current_node = head
      index.times do
        current_node = current_node.next_node
      end
      current_node.data
    end
  end
end


class RecursiveLinkedList
  attr_reader :head

  def initialize(head=nil)
    @head = head
  end

  def recursive_append(data, current = head)
    node = Node.new(data)
    if head.nil?
      @head = node
    elsif head.next_node.nil?
      @head.next_node = node
    elsif current.nil?
      current = node
      current
    elsif current.next_node
      recursive_append(data, current.next_node)
    end
  end

  def recursive_count(node = head)
    if node.nil?
      0
    else
      1 + recursive_count(node.next_node)
    end
  end

end


class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end
end


if __FILE__ == $0
 list = RecursiveLinkedList.new
 list.recursive_append("Jamie")
 list.recursive_append("Mike")
 list.recursive_append("Andrew")
 list.recursive_append("Jeff")
 puts list.head.next_node.data
 puts list.recursive_count
end





# "append" elements to the end of the list
# Count the number of the elements in the list
# access the "tail" (last element) of the list
# "pop" an element from the end of the list
# access an element by numeric position (as with an array index)

## extras distance between two nodes
#dequeue delete head node
#delete a selected element
#https://github.com/mikedao/linked_lists
#https://vimeo.com/turing
#https://vimeo.com/117724281 iterating linked lists iteratively

# from Horace's class outline
#Pop the "first" element (head gets removed, second element becomes head)
# Push an element onto the beginning of the list (first element becomes second element)
# Remove the (first occurance | all occurances) of an element by data content
# Remove an element by position
# Insert an element at an arbitrary position
# Add an element after a known node
# Find whether a data element is or is not in the list
# Find the distance between two nodes


# Insert elements
# Pop an element from the end
# Push an element onto the beginning
# Remove the (first occurance | all occurances) of an element by data content
# Remove an element by position
# Add an element at an arbitrary position
# Add an element after a known node
# Find whether a data element is or is not in the list
# Find the distance between two nodes
