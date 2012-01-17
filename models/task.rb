module Todo
  class Task
    attr_reader :name, :id

    def initialize task_name
      @name = task_name
      @completed = false
      @id = self.class.next_id
      self.class.add_task_to_registry self
    end

    def completed?
      @completed
    end

    def complete!
      @completed = true
    end

    def uncomplete!
      @completed = false
    end

    # A function and variable for auto-incrementing IDs.
    @id = 0
    def self.next_id
      @id += 1
    end

    # An array of all Task objects currently in memory.
    @all_tasks = []

    # Called by the Task#initialize to add each list to the Array.
    def self.add_task_to_registry task
      @all_tasks << task
    end

    # Imitates ActiveRecord's #all method.
    def self.all
      @all_tasks
    end

    # Imitates ActiveRecord's #find_by_id method.
    def self.find_by_id id
      all.find { |task| task.id == id.to_i }
    end
  end
end

