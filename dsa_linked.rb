class LinkedList
  attr_reader :head

  def count
    if head.nil?
      0
    elsif head.next_node.nil?
      head.next_node = node
      1
    end
  end

  def push(data)
    #need to make a new node to house data because lists don't deal with data
    node = Node.new(data)
    if head.nil? #if don't have head then we assign head the node
      @head = node
    else
      current = head
      while current.next_node
        current = current.next_node
      end
      current.next_node = node
    end
  end



  def recursive_count(node = head) #using arguments to keep track of of the current node
    if node.nil?
      0
    else
      1 + recursive_count(node.next_node)
    end
  end


  def recursive_append(data, current = head)
    node = Node.new(data)
    if current.nil?
      @head = node
    else
      if current.next_node
        recursive_append(data, current.next_node)
      else
        current.next_node = node
      end
    end
  end

  def rec_position(index, current = head)
    return nil unless current #early exit
    if index == 0
      current.data
    else
      position(index - 1, current.next_node) #making the positions relative and moving the zero point
    end
  end

  def rec_pop(current = head)
    if current.nil?
      @head = nil
    elsif current.next_node && current.next_node.next_node.nil?
      node.next_node = nil
    else
      rec_pop(node.next_node)
    end
  end


end


class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
  end

end
