require 'httparty'
require 'json'

class Infos

  def initialize
    @data = JSON.parse(HTTParty.get('https://jsonplaceholder.typicode.com/users').body)
  end

  def listName
    puts 'Falha ao obter os nomes' if @data.nil?
    puts '1 -'

    @data.each { |infos| puts infos['name'] }
  end

  def listCity
    puts 'Falha ao obter as cidades' if @data.nil?
    puts "\n2 -"

    @data.each { |infos| puts infos.dig('address', 'city') }
  end

  def listUserNameEndEmail
    puts 'Falha ao obter as cidades' if @data.nil?
    puts "\n3 - "

    @data.each do |infos|
      if infos['email'].match?(/biz/)
        puts "#{infos['username']} - #{infos['email']}"
      end
    end
  end
end

classy = Infos.new

classy.listName
classy.listCity
classy.listUserNameEndEmail
