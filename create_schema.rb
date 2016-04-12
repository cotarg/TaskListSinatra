require_relative 'lib/database'

our_tasks = TaskList::Database.new
our_tasks.create_schema