module Todo
  class List
    attr_reader :name, :id

    def initialize list_name
      @name = list_name
      @tasks = []
      @id = self.class.next_id
    end

    def add_task task
      @tasks << task
    end

    def each_task &block
      if block
        @tasks.each &block
      else
        @tasks.each
      end
    end

    @id = 0
    def self.next_id
      @id += 1
    end

    @all_lists = []
    def self.all
      @all_lists
    end
  end
end

