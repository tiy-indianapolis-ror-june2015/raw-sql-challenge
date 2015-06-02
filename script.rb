require 'csv'

def command_to_add_user first_name, last_name, email
  "SELECT COUNT(*) FROM users;" # Write the correct SQL statement here
end

def run_command sql
  system %{ sqlite3 db.sqlite3 \"#{sql}\" }
end

File.open "commands", "w" do |f|
  CSV.foreach "new_users.csv" do |first_name, last_name, email|
    run_command command_to_add_user(first_name, last_name, email)
  end
end
