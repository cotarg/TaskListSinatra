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

    def reset_schema!
      db.execute("DROP TABLE IF EXISTS tasks;")
      create_schema
    end
  end

  class Task < Database

     attr_reader :task_to_enter

    def initialize(input)
      # we want this to store a hash that uses column names as hash keys
      # this holds the params hash
      @task_to_enter = input
    end

    def add_task(task_details)
      insert_statement = <<-INSERTSTATEMENT

        INSERT INTO tasks (
          title, description, completed_at
        ) VALUES (
          :title, :description, :completed_at
        );

      INSERTSTATEMENT
    end


    def all_tasks
      query = <<-QUERY
        SELECT * FROM tasks;
      QUERY
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
