# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

def Sluggish_Octopus(array)

  check = true
  while check
    check = false
    i = 0
    while i < array.length - 1
      j = i +1
      while j < array.length
        if array[i].length > array[j].length
          array[i], array[j] = array[j], array[i]
          check = true
        end
        j += 1
      end
      i +=1
    end
  end
  return array.last
end


def my_quick(array)
  return array if array.length <= 1

  pivot = array[0]

  left = array[1..-1].select{|el| el.length < pivot.length }
  right = array[1..-1].select{|el| el.length >= pivot.length}

  my_quick(left) + [pivot] + my_quick(right)
end

def Dominant_Octopus(array)
  temp = my_quick(array)
  return temp[-1]
end

def Clever_Octopus(array)
  longest = array[0].length
  final = array[0]
  array.each do |el|
    if el.length > longest
      final = el
    end
  end
  return final
end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def Slow_Dance(target, array)

  array.each_with_index do |el, i|
    return i if el == target
  end
end

# tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" =>7 }
def fast_dance(target,new_data_struct)
  return new_data_struct[target]
end
