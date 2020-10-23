def bubbleSort(arr): 
    n = len(arr) 
  
    # Traverse through all array elements 
    for i in range(n-1): 
    # range(n) also work but outer loop will repeat one time more than needed. 
  
        # Last i elements are already in place 
        for j in range(0, n-i-1): 
  
            # traverse the array from 0 to n-i-1 
            # Swap if the element found is greater 
            # than the next element 
            if arr[j] > arr[j+1] : 
                arr[j], arr[j+1] = arr[j+1], arr[j] 
  
# Driver code
arr = [34, 56, 4, 10, 77, 51, 93, 30, 5, 52] 

print("Unsorted Array")
print(arr)

#new line separator 
print()
bubbleSort(arr) 
  
print ("Sorted Array") 
print(arr)