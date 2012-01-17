# A Port of the EngineYard Todo App to Sinatra 1.3 by Steven! Ragnarök.

# Use Bundler for dependency management.
require "bundler"
Bundler.require

module Todo
  class App < Sinatra::Base
    # Use Erubis for template compilation. Essentially a faster ERB.
    Tilt.register :erb, Tilt[:erubis]

    ## GET /
    # Entry point for the application. Displays the main page. Which is a tabbed
    # set of lists with a new list tab. The first list's tasks are displayed as
    # well.
    get "/" do
      erb :root
    end
  end
end

