require_relative 'database'

our_tasks = TaskList::Database.new
our_tasks.create_schema