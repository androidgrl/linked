require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "linked_lists"

class IterativeLinkedListTest < Minitest::Test
  attr_reader :list #so that once you've instantiated the object in the setup you can access it in other tests

  def setup
    @list = IterativeLinkedList.new
  end

  def test_linked_list_exists
    assert IterativeLinkedList
  end

  def test_it_starts_out_without_a_head_node
    refute list.head
  end


  def test_it_appends_a_node_to_an_empty_head
    list1 = list.append("Evgeny")

    assert_equal "Evgeny", list1.data
  end

  def test_it_can_append_a_node_onto_a_single_node
    list.append("Jamie")
    list.append("Dennis")

    assert_equal "Dennis", list.head.next_node.data
  end

  def test_it_can_append_a_node_onto_two_nodes
    list.append("Jamie")
    list.append("Dennis")
    list.append("Mike")

    assert_equal "Mike", list.head.next_node.next_node.data
  end

  def test_it_can_count_zero_nodes
    assert_equal 0, list.count
  end

  def test_it_can_count_one_node
    list.append("Jamie")

    assert_equal 1, list.count
  end

  def test_it_can_count_two_nodes
    list.append("Jamie")
    list.append("Douglas")

    assert_equal 2, list.count
  end

  def test_it_can_count_three_nodes
    list.append("Jamie")
    list.append("Douglas")
    list.append("Dave")

    assert_equal 3, list.count
  end

  def test_it_can_count_four_nodes
    list.append("Jamie")
    list.append("Douglas")
    list.append("Dave")
    list.append("Henry")

    assert_equal 4, list.count
  end

  def test_tail_can_return_last_node
    list.append("Jamie")
    list.append("Douglas")
    list.append("Dave")
    list.append("Henry")

    assert_equal "Henry", list.tail.data
  end

  def test_it_can_pop_a_node_from_a_single_node_list
    list.append("Jamie")
    assert_equal "Jamie", list.pop
  end

  def test_it_can_pop_a_node_from_a_list_with_two_nodes
    list.append("Jamie")
    list.append("Douglas")

    assert_equal "Douglas", list.pop
  end

  def test_it_can_pop_a_node_from_a_list_with_three_nodes
    list.append("Jamie")
    list.append("Douglas")
    list.append("David")

    assert_equal "David", list.pop
  end

  def test_it_can_access_an_element_by_numeric_position_for_a_empty_list
    refute list.access(3), "This is an empty list"
  end

  def test_it_can_access_an_element_by_numeric_position_for_a_single_node_list
    list.append("Jamie")
    assert_equal "Jamie", list.access(0)
  end

  def test_it_can_access_an_element_by_its_numeric_position_for_three_node_list
    list.append("Jamie")
    list.append("Mike")
    list.append("Alex")

    assert_equal "Alex", list.access(2)
  end

  def test_it_can_access_an_element_by_its_numeric_position_for_five_node_list
    list.append("Jamie")
    list.append("Mike")
    list.append("Alex")
    list.append("Tracy")
    list.append("Jeff")

    assert_equal "Tracy", list.access(3)
  end

end

class RecursiveLinkedListTest < Minitest::Test

  def test_it_exists
    assert RecursiveLinkedList
  end

  def test_it_starts_out_without_a_head_node
    list = RecursiveLinkedList.new

    refute list.head
  end

  def test_it_can_append_onto_an_empty_list
    list = RecursiveLinkedList.new

    list.recursive_append("Jamie")

    assert_equal "Jamie", list.head.data
  end

  def test_it_can_append_onto_a_single_node_list
    list = RecursiveLinkedList.new

    list.recursive_append("Jamie")
    list.recursive_append("Bob")

    assert_equal "Bob", list.head.next_node.data
  end

  def test_it_can_count_an_empty_list
    list = RecursiveLinkedList.new

    assert_equal 0, list.recursive_count
  end

  def test_it_can_count_a_single_node_list
    list = RecursiveLinkedList.new

    list.recursive_append("Jamie")

    assert_equal 1, list.recursive_count
  end

  def test_it_can_count_a_double_node_list
    list = RecursiveLinkedList.new

    list.recursive_append("Jamie")
    list.recursive_append("Bob")

    assert_equal 2, list.recursive_count
  end

  def test_it_can_count_a_triple_node_list
    list = RecursiveLinkedList.new

    list.recursive_append("Jamie")
    list.recursive_append("Bob")
    list.recursive_append("Mary")

    assert_equal 3, list.recursive_count
  end

  def test_it_can_append_onto_a_double_node_list
    list = RecursiveLinkedList.new

    list.recursive_append("Jamie")
    list.recursive_append("Bob")
    list.recursive_append("Mark")

    assert_equal "Mark", list.head.next_node.next_node.data
  end
end

class NodeTest < Minitest::Test
  attr_reader :node   # you do this to be able to type node without the @, and can now access instance variable from outside of the class

  def test_node_exists
    @node = Node.new("Jamie", next_node=nil)
    assert Node
  end

  def test_it_has_data
    @node = Node.new("Jamie", next_node=nil)
    assert_equal "Jamie", node.data
  end

  def test_it_starts_out_without_a_link
    @node = Node.new("Jamie", next_node=nil)
    refute node.next_node
  end

  def test_it_has_a_next_node_attribute
    @node = Node.new("Jamie", next_node=nil)

    node1 = Node.new("Jamie")
    node2 = Node.new("Danny")
    node1.next_node = node2

    assert_equal "Danny", node1.next_node.data
    assert_equal Node, node1.next_node.class
  end
end
