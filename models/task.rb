module Todo
  class Task
    attr_reader :name

    def initialize task_name
      @name = task_name
      @completed = false
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
  end
end

