Getting Things Done With EngineYard AppCloud: Sinatra Edition
============================================================

Getting It
----------

Clone it using Git or Mercurial.

`hg clone https://bitbucket.org/nuclearsandwich/sinatra_todo`

or

`git clone git://github.com/nuclearsandwich/sinatra_todo.git` (Coming Soon)

Running It
----------

After cloning the project and running `bundle install`. You can start the app
with `bin/rake run`.

If you want to restart on every code change, you can use the `bin/rake rerun`
task.

Testing It
----------

Tests are run with the default rake task. You can run them explicitly using
`rake test`.

For continuous testing, the   `bin/rake rerun:test` command also exists.

Deploying It
------------

Coming soon.

Differences from the Rails 3 App
--------------------------------

- Links are not highlighted in task names.

Sinatra lacks the auto_link helper and vendorizing it proved non-trivial. I plan
to add it as I work on more of these ports.
