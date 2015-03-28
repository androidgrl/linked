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
      head
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
      (index-1).times do
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

  def recursive_count (node = head)
    if node.nil?
       0
    else
       1 + recursive_count(node.next_node)
    end
  end

  def recursive_pop(current = head)
    if current.nil?
      @head = nil
    elsif current.next_node && current.next_node.next_node.nil?
      current.next_node = nil
    else
      recursive_pop(current.next_node)
    end
  end

  def recursive_position(index, current = head)
    return nil unless current
    if index == 0
      current.data
    else
      recursive_position(index - 1, current.next_node)
    end
  end

  def recursive_delete(index, current = head)
    return nil unless current
    if index == 1
      @head = current.next_node
    else
      recursive_delete(index-1, current.next_node)
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
