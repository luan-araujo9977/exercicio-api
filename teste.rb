require 'httparty'
require 'json'

def listName
  response = HTTParty.get('https://jsonplaceholder.typicode.com/users')
  i = 0
  name = []

  while JSON.parse(response.body)[i] != nil
    name.push(JSON.parse(response.body)[i]["name"])
    i = i + 1
  end
  name.sort.each do |name|
    puts name
  end
end

def listCity
  response = HTTParty.get('https://jsonplaceholder.typicode.com/users')
  i = 0

  while JSON.parse(response.body)[i] != nil
    puts JSON.parse(response.body)[i]["address"]["city"]
    i = i + 1
  end
end

def listUserNameEndEmail
  response = HTTParty.get('https://jsonplaceholder.typicode.com/users')
  i = 0
  
  while JSON.parse(response.body)[i] != nil
    email = JSON.parse(response.body)[i]["email"]
    if /.biz/.match(email) != nil
      print JSON.parse(response.body)[i]["username"]
      print ' - '
      puts email
    end
    i = i + 1
  end
end

listName()
p '---------------------------'
listCity()
p '---------------------------'
listUserNameEndEmail()
