module Enumerable
  #each
    def my_each
      index = 0
      while index < self.length
        yield(self[index])
        index += 1
      end
    end
  
  #each_with_index
    def my_each_with_index
      index = 0
      while index < self.length
        yield(self[index],index)
        index += 1
      end
    end
  
  #select
    def my_select
      new_arr = Array.new()
      self.my_each {|elem| new_arr << elem if yield(elem)}
      new_arr
    end
  
  #all?
    def my_all?
      result = false
      self.my_each {|elem| yield(elem) ? result = true : result = false }
      result
    end
  
  #any?
    def my_any?
      result = false
      self.my_each {|elem| result = true if yield(elem)}
      result
    end
  
  #none
    def my_none?
      result = true
      self.my_each {|elem| result = false if yield(elem)}
      result
    end
  
  #count
    def my_count num = nil
      count = 0
        if num 
          self.my_each {|elem| count += 1 if elem == num}
        elsif block_given?
          self.my_each {|elem| count += 1 if yield(elem)}
        else
          count = self.length
        end 
      count
    end
  
  #map 
    def my_map block = nil
      new_arr = Array.new()
      if block
        self.my_each_with_index {|elem,index| new_arr[index] = block.call(elem)}
      else
        self.my_each_with_index {|elem,index| new_arr[index] = yield(elem)}
      end
      new_arr
    end
  
  #inject
    def my_inject initial = nil
      initial == nil ? result = self[0] : result = initial
  
      for i in 1..self.length - 1 
        result = yield(result,self[i])
      end 
      result
    end
  end
  
  
  test_arr = [100,54,1,2,3,4]
  
  #each
  #test_arr.each {|num| puts num*2}
  #test_arr.my_each {|num| puts num*2}
  
  #each_with_index
  #test_arr.each_with_index {|num,i| puts num + i}
  #test_arr.my_each_with_index {|num,i| puts num + i}
  
  #select
  #print test_arr.select {|num| num % 2 == 0}
  #print test_arr.my_select {|num| num % 2 == 0}
  
  #all?
  #print test_arr.all? {|num| num.is_a? Integer}
  #print test_arr.all? {|num| num.is_a? String}
  #print test_arr.my_all? {|num| num.is_a? Integer}
  #print test_arr.my_all? {|num| num.is_a? String}
  
  #any?
  #print test_arr.any? {|num| num.is_a? Integer}
  #print test_arr.any? {|num| num.is_a? String}
  #print test_arr.my_any? {|num| num.is_a? Integer}
  #print test_arr.my_any? {|num| num.is_a? String}
  
  #none?
  #print test_arr.none? {|num| num.is_a? String}
  #print test_arr.none? {|num| num.is_a? Integer}
  #print test_arr.my_none? {|num| num.is_a? String}
  #print test_arr.my_none? {|num| num.is_a? Integer}
  
  #count
  #print test_arr.count {|num| num < 4}
  #print test_arr.count(5)
  #print test_arr.count
  #print test_arr.my_count
  #print test_arr.my_count(5)
  #print test_arr.my_count {|num| num < 4}
  
  #map
  #print test_arr.map {|num| num * 10 }
  #test_block = Proc.new {|elem| elem * 10}
  #print test_arr.map(&test_block)
  #print test_arr.my_map {|num| num * 10 }
  #print test_arr.my_map(&test_block)
  
  #inject
  #print test_arr.inject {|result,elem| result + elem}
  #print test_arr.my_inject {|result,elem| result + elem}
  #def multiply_els arr
  #  arr.inject {|result,elem| result*elem }
  #  arr.my_inject {|result,elem| result*elem }
  #end
  #print multiply_els test_arr