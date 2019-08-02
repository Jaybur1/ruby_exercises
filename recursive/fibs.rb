def fibs(n)
  arr = [1,1]
    while arr.length < n
    arr.push(arr[-1] + arr[-2])
    end
  
  arr
end

p fibs(8) #=> [1,1,2,3,5,8,13,21]


def fibs_rec(n)
  arr = [1,1]
  n < 3 ? arr[0..n-1] : fibs_rec(n - 1) << (fibs_rec(n-1)[-1] + fibs_rec(n-1)[-2]) 
end

p fibs_rec(8) #=> [1,1,2,3,5,8,13,21]