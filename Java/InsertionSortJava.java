/*
	Name: Nicoh Carter
	Purpose: Insertion Sort
	Language: Java
*/
 
public class InsertionSortJava
{
	public static void main (String[] args)
   {
		// An array of integers
		int[] array = {34, 56, 4, 10, 77, 51, 93, 30, 5, 52 };
		
		// Print the unsorted array
		System.out.println("Unsorted Array");
		for (int i = 0; i < array.length; i++)
			System.out.print(array[i] + " ");
		
		// Insertion Sort    
		for (int i = 1; i < array.length; i++)
		{
			int temp = array[i];
			int j;
			for (j = i-1; j >= 0 && temp < array[j]; j--)
				array[j+1] = array[j];
			array[j+1] = temp;
		}
		
		// Print the sorted array
		System.out.println("\n\nSorted Array");
		for (int i = 0; i < array.length; i++)
			System.out.print(array[i] + " ");
		System.out.println(" ");
				
	}
}