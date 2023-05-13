module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.size
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    output_array = []
    my_each { |item| output_array.push(item) if yield item }
    output_array
  end

  def my_all?
    output = true
    my_each { |item| output = false unless yield item }
    output
  end

  def my_any?
    output = false
    my_each { |item| output = true if yield item }
    output
  end

  def my_none?
    output = true
    my_each { |item| output = false if yield item }
    output
  end

  def my_count
    return self.size unless block_given?
    output = 0
    my_each { |item| output += 1 if yield item }
    output
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
    self
  end
end
