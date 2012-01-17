require "minitest/unit"
require "minitest/autorun"
require "minitest/pride"
require_relative "../models/list"

class ListTest < MiniTest::Unit::TestCase
  def setup
    @list = Todo::List.new "Secret Mission"
  end

  def test_list_creation
    assert @list, "No list was created."
  end

  def test_list_has_name
    assert_equal "Secret Mission", @list.name
  end

  def test_list_can_add_tasks
    task = "1st task"
    @list.add_task task
    assert_includes @list.instance_eval{ @tasks }, task
  end

  def test_each_task_returns_enumerator
    assert_equal Enumerator, @list.each_task.class
  end

  def test_each_task_can_take_a_block
    tasks_from_block = []
    @list.add_task :foobar
    @list.add_task :bazqux

    @list.each_task do |task|
      tasks_from_block << task
    end

    assert_equal 2, tasks_from_block.size
  end
end

