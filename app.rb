# A Port of the EngineYard Todo App to Sinatra 1.3 by Steven! Ragnarök.

# Use Bundler for dependency management.
require "bundler"
Bundler.require

# Require models.
require_relative "models/list"
require_relative "models/task"

# The entire application is nested within the `Todo` module.
module Todo

  # The main Sinatra Application. This is the app that is run in `config.ru`.
  class App < Sinatra::Base

    # Use Erubis for template compilation. Essentially a faster ERB.
    Tilt.register :erb, Tilt[:erubis]

    ## GET /
    # Entry point for the application. Displays the main page. Which is a tabbed
    # set of lists with a new list tab. The first list's tasks are displayed as
    # well.
    get "/" do
      @lists = List.all
      erb :show_tasks
    end

    ## POST /lists
    # Create a new list with the given name, then return to `/`.
    post "/lists" do
      List.all << List.new(params[:list][:name])
      redirect "/"
    end

    ## POST /tasks
    # Create a new task with the given name, then return to the correct tab of
    # '/'.
    post "/tasks" do
      @task = Task.new params[:task][:name]
      List.all.find{ |l| l.id == params[:task][:list_id] }.add_task @task
    end
  end
end

