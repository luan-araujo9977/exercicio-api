require 'httparty'
require 'json'

def list_name
  response = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  i = 0
  name = []
  puts '1 -'

  while response[i] != nil
    name.push(response[i]['name'])
    i += 1
  end
  name.sort.each { |name| puts name }
end

def list_city
  response = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  i = 0
  puts '2 -'

  while response[i] != nil
    puts response[i]['address']['city']
    i += 1
  end
end

def list_user_name_end_email
  response = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  puts '3 -'

  i = 0
  while response[i] != nil
    email = response[i]['email']
    if /.biz/.match(email)
      puts "#{response[i]['username']} - #{email}"
    end
    i += 1
  end
end

list_name()
list_city()
list_user_name_end_email()
