def bubble_sort(arr) 
  index = 0
  err = 0
 while index < arr.length-1
   if arr[index] > arr[index + 1]
     big = arr[index]
     small = arr[index + 1]
     arr[index] = small
     arr[index + 1] = big
     err += 1
   end
   if index == arr.length - 2 && err > 0
     index = 0
     err = 0
   else
   index += 1
   end
 end
 arr
end


def bubble_sort_by(arr)
 index = 0
 err = 0
 while index < arr.length-1
   if yield(arr[index],arr[index + 1]) > 0
     big = arr[index]
     small = arr[index + 1]
     arr[index] = small
     arr[index + 1] = big
     err += 1
   end
   if index == arr.length - 2 && err > 0
     index = 0
     err = 0
   else
   index += 1
   end
 end
 arr
end

bubble_sort([4,3,78,2,0,2]) 
bubble_sort_by(["hi","hello","hey"]) {|left,right|
left.length - right.length}


#[0,2,2,3,4,78]
#["hi", "hey", "hello"]