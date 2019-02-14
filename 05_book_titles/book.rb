class Book
	attr_accessor  :title

  	def title=(str)
  	  little_words_arr = ['the','in','over','and', 'on','a', 'an','of']
		  words_arr = str.split
		    words_arr[0].capitalize!
		  words_arr.each do |word|
			  if !little_words_arr.include? word
				  word.capitalize!
			  end
		  end
	    @title = words_arr.join(' ')
	  end
end
