Pace
====

Building:
`gem build pace.gemspec`

Running:
# Create the database tables
pace-create-table /path/to/config/file

# Use the command line app
pace-console /path/to/config/file

Requirements:
- An ActiveRecord style config file (similar to a database.yml)
- A running Postgres instance
