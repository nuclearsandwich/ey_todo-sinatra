require "minitest/unit"
require "minitest/autorun"
require "minitest/pride"
require_relative "../models/list"

class ListTest < MiniTest::Unit::TestCase
  def setup
    @list = Todo::List.new "Secret Mission"
    @completed_tasks = Array.new 4, OpenStruct.new(:completed? => true)
    @unfinished_tasks = Array.new 3, OpenStruct.new(:completed? => false)

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

  def test_list_can_remove_tasks
    task = "Eat all the toffee"
    @list.add_task task

    @list.remove_task task
    refute_includes @list.instance_eval{ @tasks }, task
  end

  def test_completed_tasks_contains_only_completed_tasks
    (@completed_tasks + @unfinished_tasks).each do |t|
      @list.add_task t
    end
    assert @list.completed_tasks.all?(&:completed?),
      "Incomplete task found in completed_tasks"
  end

  def test_unfinished_tasks_contains_no_completed_tasks
    (@completed_tasks + @unfinished_tasks).each do |t|
      @list.add_task t
    end
    refute @list.unfinished_tasks.any?(&:completed?),
      "Completed task found in unfinished_tasks"
  end

  def test_each_list_has_unique_id
    @list.id != Todo::List.new("A Different List").id
  end
end

