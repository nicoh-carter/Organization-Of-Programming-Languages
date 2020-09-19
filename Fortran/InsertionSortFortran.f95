!Name: Nicoh Carter
!Purpose: Insertion Sort
!Language: Fortran
Program InsertionSort
IMPLICIT NONE

!An array of integers
INTEGER, DIMENSION(10) :: array = (/34, 56, 4, 10, 77, 51, 93, 30, 5, 52/)
INTEGER :: i, j, temp

!Printing the unsorted array
WRITE(*, 100) 'Unsorted Array', array
100 FORMAT (A, /, 10I3)

!Insertion Sort
DO i = 2, SIZE(array)
  temp = array(i)
  j = i-1
  DO WHILE (j >= 1)
    IF(array(j) <= temp) EXIT
    array(j+1) = array(j)
    j = j-1
  END DO
  array(j+1) = temp
END DO
    

!Printing the sorted array
WRITE(*, 110) 'Sorted Array', array
110 FORMAT (/, A, /, 10I3)

END PROGRAM InsertionSort