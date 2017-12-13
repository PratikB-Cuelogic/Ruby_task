require_relative 'test1'
require_relative 'test2'

class API
  module Adapter

    include Owl
    include Google
    module Yahoo
      def self.speak
        puts "yahoo!"
      end
      def self.loose
        puts"hehehee"
      end
    end
  end

  def speak
    self.adapter.speak
  end

  def loose
    self.adapter.loose
  end

  def adapter
    print "2",@adapter,"\n"
    return @adapter if @adapter
    self.adapter = :Google
    @adapter
  end

  def adapter=(adapter)
    print"1", adapter,"\n"
    @adapter = API::Adapter.const_get(adapter.to_s.capitalize)
  end
end

animal = API.new
animal.speak
animal.loose
animal.adapter = :Yahoo#module call
animal.speak

animal.adapter = :Owl
animal.speak