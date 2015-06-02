require 'csv'

def command_to_add_user first_name, last_name, email
  # "SELECT COUNT(*) FROM users;" # Write the correct SQL statement here
  "INSERT INTO users VALUES (null,'#{first_name}','#{last_name}','#{email}');"
end

def run_command sql
  system %{ sqlite3 db.sqlite3 \"#{sql}\" }
end

CSV.foreach "new_users.csv" do |first_name, last_name, email|
  run_command command_to_add_user(first_name, last_name, email)
end