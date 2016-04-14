require "sqlite3"

module TaskList
  class Database
    attr_reader :db

    def initialize(db_name = "tasklist")
      @db = SQLite3::Database.new("database/#{db_name}.db")
    end

    def create_schema
      # Put your ruby code here to use the @db variable
      # to setup your schema in the database.

      query = <<-CREATESTATEMENT
        CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        completed_at TEXT
        );
      CREATESTATEMENT

      db.execute(query)
    end

    # separated reset from create BECAUSE METZ!
    def reset_schema!
      db.execute("DROP TABLE IF EXISTS tasks;")
      create_schema
    end
  end

  class Task < TaskList::Database

    attr_reader :db

    def initialize(db_name = "tasklist")
      @db = SQLite3::Database.new("database/#{db_name}.db")
    end

    # USES BIND VARIABLES (and was confusing).
    def add_task(title, description, completed_at)
      insert_statement = <<-INSERTSTATEMENT

        INSERT INTO tasks (
          title, description, completed_at
        ) VALUES (
          ?, ?, ?
        );

      INSERTSTATEMENT

      db.execute(insert_statement, title, description, completed_at)
    end

    # THIS SHOULD BE THE METHOD THAT SHOWS EVERYTHING TO THE INDEX PAGE TO FORMAT NICELY
    # IT ALMOST ASSUREDLY DOESN'T WORK THE WAY I WANT IT TO
    # AND EVEN IF IT DOES I PROBABLY DON'T KNOW WHY!
    def all_tasks
      query = <<-QUERY
        SELECT * FROM tasks;
      QUERY

      db.execute(query)
    end

    def make_tasks_pretty
      # RATHER THAN WRITE AN UGLY SINATRA BLOCK, LET'S WRITE A PRETTY RUBY METHOD
      # It should:


      # iterate the array delivered by all_tasks and format each one as a line item for display.
    end

    def find_task(task_id)
      query = <<-QUERY
        SELECT * FROM tasks
        WHERE id = ?;
      QUERY

      db.execute(query, task_id)
    end

    # WRITE THIS METHOD LATER. YOU WILL WANT IT!
    # def select_task(column, detail_to_select_for)
    #   query = <<-QUERY
    #     SELECT * FROM tasks
    #     WHERE ? = ?

    #   QUERY

    # end

  end
end

our_tasks = TaskList::Database.new
