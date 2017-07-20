# Code Sample from the tutorial at https://learncodeshare.net/2016/08/26/basic-crud-operations-using-ruby-oci8/
#  section titled "Boilerplate template"
# The following code is used as the base template for the other examples.

require 'oci8'
connectString = ENV['db_connect']

def get_all_rows (label)
 connectString = ENV['db_connect']
 con = OCI8.new(connectString)

 # Query all rows
 statement = 'select id, name, age, notes from lcs_people order by id'
 cursor = con.parse(statement)
 cursor.exec
 printf " %s:\n", label
 cursor.fetch() {|row|
 printf "  Id: %d, Name: %s, Age: %d, Notes: %s\n", row[0], row[1], row[2], row[3]
 }
 printf "\n"
end

con = OCI8.new(connectString)

get_all_rows('Original Data')

# Your code here

get_all_rows('New Data')
