       identification division.
       program-id. InsertionSort-Cobol.

       environment division.
       configuration section.

       data division.
       working-storage section.
       01 some-rubbish pic x.
       01 arraydata value ' 34 56  4 10 77 51 93 30  5 52'.
         05 array occurs 10 times pic zz9.

       01 displayarray pic z9.
       01 spacing pic 99.
       01 i pic 99.
       01 j pic 99.
       01 k pic 99.
       01 temp pic zz9.
       01 sizeof pic 99.
       

       procedure division.
           divide length of arraydata by length of array giving sizeof.
           

           *>print the unsorted array

           display "Unsorted Array" at line number 1 column 1.
           move 1 to spacing.
           perform varying i from 1 by 1 until i is greater than sizeof
               move array(i) to displayarray
               display displayarray at line number 2 column spacing
               add 3 to spacing
           end-perform.
           display " ".

           *>Insertion Sort
           perform varying i from 2 by 1 until i is greater than sizeof
               move array(i) to temp
               subtract 1 from i giving j
               perform varying j from j by -1 until j is equal to 0
                   if temp is less than array(j)
                       move array(j) to array(j + 1)
                       move temp to array(j)
                   end-if
               end-perform
           end-perform.


           *>print the sorted array
           display "Sorted Array" at line 4 column 1.
           move 1 to spacing.
           perform varying i from 1 by 1 until i is greater than sizeof
               move array(i) to displayarray
               display displayarray at line number 5 column spacing
               add 3 to spacing
           end-perform.
           display " ".

           *>make console stay on screen for debugging
           accept some-rubbish from console.

       end program InsertionSort-Cobol.