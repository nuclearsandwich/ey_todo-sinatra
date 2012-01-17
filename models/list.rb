module Todo
  class List
    attr_reader :name

    def initialize list_name
      @name = list_name
      @tasks = []
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
  end
end

