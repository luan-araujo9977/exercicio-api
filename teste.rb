require 'httparty'
require 'json'

def listName
  response = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  i = 0
  name = []
  puts '1 -'

  while response[i] != nil
    name.push(response[i]['name'])
    i = i + 1
  end
  name.sort.each do |name|
    puts name
  end
end

def listCity
  response = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  i = 0
  puts '2 -'

  while response[i] != nil
    puts response[i]['address']['city']
    i = i + 1
  end
end

def listUserNameEndEmail
  response = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  i = 0
  puts '3 -'
  
  while response[i] != nil
    email = response[i]['email']
    if /.biz/.match(email) 
      puts "#{response[i]['username']} - #{email}"
    end
    i = i + 1
  end
end

listName()
listCity()
listUserNameEndEmail()
