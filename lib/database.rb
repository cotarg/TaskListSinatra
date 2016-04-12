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
end

our_tasks = TaskList::Database.new
