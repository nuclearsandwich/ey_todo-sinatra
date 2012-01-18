module Todo
  class List
    attr_reader :name, :id

    def initialize list_name
      @name = list_name
      @tasks = []
      @id = self.class.next_id
      self.class.add_list_to_registry self
    end

    def add_task task
      @tasks << task
    end

    def remove_task task
      @tasks.delete task
    end

    # A collection of all completed tasks.
    def completed_tasks
      @tasks.select(&:completed?)
    end

    # A collection of all unfinished tasks.
    def unfinished_tasks
      @tasks.reject(&:completed?)
    end

    # Destroy method mimicking ActiveRecord's
    def destroy
      self.class.all.reject! { |list| list == self }
      self
    end

    # # Class Management Features
    #
    # Some quick cheap functions to add ORM-like behavior to plain Ruby classes.
    # These will be removed when the transition to ActiveRecord is made.

    # A function and variable for auto-incrementing IDs.
    @id = 0
    def self.next_id
      @id += 1
    end

    # An array of all List objects currently in memory.
    @all_lists = []

    # Called by the List#initialize to add each list to the Array.
    def self.add_list_to_registry list
      @all_lists << list
    end

    # Imitates ActiveRecord's #all method.
    def self.all
      @all_lists
    end

    # Imitates ActiveRecord's #find_by_id method.
    def self.find_by_id id
      all.find { |list| list.id == id.to_i }
    end
  end
end

