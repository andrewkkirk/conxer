class Person
	def initialize(attrs = {})
		@attrs = attrs
	end

	def method_missing(name, *args, &block)
		if @attrs.keys.include?(name)
			return @attrs[name]
		end

		super
	end
end

person = Person.new(name: "Alex", age: 27, gender: 'male')
puts person.name
puts person.age
puts person.gender