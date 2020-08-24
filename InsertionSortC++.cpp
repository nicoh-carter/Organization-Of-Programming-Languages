/*
	Name: Nicoh Carter
	Purpose: Insertion Sort
    Language: C++
*/
#include <bits/stdc++.h>
#include <iostream>
using namespace std;

int main()
{
    
    // An array of integers
	int array[] = {34, 56, 4, 10, 77, 51, 93, 30, 5, 52 };
	int n = sizeof(array)/sizeof(array[0]);
	
	//Unsorted array
	cout<<("Unsorted Array\n");
	for (int i = 0; i < n; i++)
			cout<< array[i] << " ";
		
    //Insertion Sort    
    for (int i = 1; i < n; i++)
    {
        int temp = array[i];
        int j;
        for (j = i-1; j >= 0 && temp < array[j]; j--)
           array[j+1] = array[j];
        array[j+1] = temp;
    }
		
		// Sorted array
		cout<<("\n\nSorted Array\n");
		for (int i = 0; i < n; i++)
			cout<< array[i] << " ";
	return 0;
}