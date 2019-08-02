def merge_sort(arr)
  return arr if arr.size <= 1

  arr_1 = merge_sort(arr[0..(arr.length / 2 - 1)])
  arr_2 = merge_sort(arr[(arr.length / 2)..-1])
  merge(arr_1,arr_2)
end

def merge(arr_1, arr_2)
  merged_arr = Array.new
  until arr_1.length == 0 || arr_2.length == 0
    if arr_1[0] < arr_2[0]
      merged_arr << arr_1[0]
      arr_1.slice!(0)
    else
      merged_arr << arr_2[0]
      arr_2.slice!(0)
    end
  end 
  merged_arr += (arr_1 + arr_2)
end


merge_sort([108,15,50,4,8,42,23,16])