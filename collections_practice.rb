# your code goes here
def begins_with_r(arr)
  result = true
  arr.each do |word|
    if !word.start_with?("r")
      result = false
    end
  end
  result
end

def contain_a(arr)
  arr.select do |word|
    word.include? "a"
  end
end

def first_wa(arr)
  arr.find {|word| word.to_s.start_with?("wa")}
end

def remove_non_strings(arr)
  arr.select {|word| word.class == String}
end

def count_repeated_times(repeated_name_arr, name)
  count = 0
  repeated_name_arr.each {|n| count += 1 if name == n}
  count
end
def make_a_count_hashArray(uniq_name_arr, repeated_name_arr)
  hashArray =[]
  uniq_name_arr.each do |name|
    hashArray.push({:name => name, :count => count_repeated_times(repeated_name_arr, name)})
  end
  hashArray
end

def count_elements(arr)
  uniq_name_arr = []
  repeated_name_arr = []
  arr.each do |name_hash|
    if !uniq_name_arr.include?(name_hash[:name])
      uniq_name_arr.push(name_hash[:name])
      repeated_name_arr.push(name_hash[:name])
    else
      repeated_name_arr.push(name_hash[:name])
    end
  end
  make_a_count_hashArray(uniq_name_arr, repeated_name_arr)
end

def merge_data(keys, data)
  keys.each do |keys|
    data[0].keys.each do |name|
      if name == keys[:first_name]
        data[0][name].each do |key, info|
          keys[key] = info
        end
      end
    end
  end
end

def find_cool(hash)
  hash.select do |info|
    info[:temperature] == "cool"
  end
end

def find_uniq_areas(hash)
  uniq_area_array = []
  hash.values.each do |school|
    uniq_area_array.push(school[:location]) if !uniq_area_array.include?(school[:location])
  end
  uniq_area_array
end

def make_empty_organized_schools_hash(uniq_area_array)
  organized_schools_hash = {}
  uniq_area_array.each do |area|
    organized_schools_hash[area] = []
  end
  organized_schools_hash
end

def organize_schools(school_hash)
  uniq_area_array = find_uniq_areas(school_hash)

  organized_schools_hash = make_empty_organized_schools_hash(uniq_area_array)
  puts organized_schools_hash
  organized_schools_hash.map do |area, array|
    school_hash.each do |school_name, location|
      array.push(school_name) if location[:location] == area
    end
  end
  organized_schools_hash
end
