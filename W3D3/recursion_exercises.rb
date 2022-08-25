

def range(start, final)
  return [] if start >= final 
  return [start] if final - start == 1
  range(start, final - 1) + [final - 1]
end


def exp1(base, power)
  return 1 if power == 0
  base * exp1(base, power - 1 )
end

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1

  if power % 2 == 0
   return exp2(base, power/2) ** 2
  else
    base * (exp2(base, power/2) ** 2)
  end
end


def deep_dup(arr)
  copy = arr.map do |ele|
    if !ele.is_a?(Array) 
      ele
    else
      deep_dup(ele)
    end
  end
  copy
end

def fib(n)
  return [] if n<=0
  return [0] if n==1
  return [0,1] if n==2
  prev_call = fib(n - 1)
  prev_call << (prev_call[-1] + prev_call[-2])
end

def b_search(arr, target)
  mid = arr.length / 2
  return mid if arr[mid] == target
  return nil if arr == [] #arr[mid] != target && arr.length == 1 
  left = arr[0...mid]
  right = arr[(mid + 1)..-1]
  if target < arr[mid]
    return b_search(left, target)
  elsif b_search(right, target) != nil
    return mid + 1 + b_search(right, target)
  else
    nil
  end
end

def merge_sort(array)
  mid = array.length / 2
  return array if array.length <= 1
  left = array[0...mid]
  right = array[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end


def merge(arr1, arr2)
  new_array = []
  array_size = arr1.length + arr2.length
  while arr1.length != 0 && arr2.length != 0
    if arr1[0] < arr2[0]
      new_array << arr1.shift
    else
      new_array << arr2.shift
    end
  end
  return new_array + arr1 if arr2.length == 0
  new_array + arr2 if arr1.length == 0
end

def subsets(array)
  return [array] if array == []
  return [[], array] if array.length == 1
  subsets(array[0...-1]) + subsets(array[0...-1]).map { |sub_s| sub_s << array[-1] }
end

def permutations(array)
  
end

