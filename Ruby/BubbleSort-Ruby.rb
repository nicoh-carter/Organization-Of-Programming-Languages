def bubble_sort(array)
    n = array.length

    loop do
        swapped = false

        (n-1).times do |i|
            j = i + 1
            if array[i] > array[j]
                array[i], array[j] = array[j], array[i]
                swapped = true
            end
        end

        break if not swapped
    end

    array
end

print "Unsorted Array\n"
array = [34, 56, 4, 10, 77, 51, 93, 30, 5, 52]
print array
print "\n\nSorted Array\n"
temp = bubble_sort(array)
print temp