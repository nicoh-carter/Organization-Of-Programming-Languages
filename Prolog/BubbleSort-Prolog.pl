/* Name: Nicoh Carter
 * Purpose: Bubble Sort Using Recursion
 * Language: Prolog
 */

check(Rel, A, B) :-
    Goal =.. [Rel, A, B],
    call(Goal).

swap(Rel, [A,B|List], [B,A|List]) :-
    check(Rel, B, A).

swap(Rel, [A|List], [A|NewList]) :-
    swap(Rel, List, NewList).

bubblesort(Rel, List, SortedList) :-
    swap(Rel, List, NewList),
    bubblesort(Rel, NewList, SortedList).

bubblesort(_, SortedList, SortedList).

sort :-
    Array = ( [34, 56, 4, 10, 77, 51, 93, 30, 5, 52] ),

    writeln("Unsorted Array"), writeln(Array),
    bubblesort(<, Array, List),
    writeln("\nSorted Array"), writeln(List).
