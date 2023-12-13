# Sorts
![Sorts](https://emiliodevesa.files.wordpress.com/2023/12/sorts.png)

Command Line program written in Pascal ISO 10206 (Extended Pascal) that sorts a given list using several sorting algorithms: BubbleSort, InsertionSort, SelectionSort, QuickSort and MergeSort.


## Blog post
https://emiliodevesa.wordpress.com/2023/12/13/sorts/


## How to use it
Compile using:

	$ make all

Then execute:

	$ bin/Sorts


## Configuration
Parameters are set inside 'Sorts.conf' text file:
- SIZE: sets the size of the list to be sorted
- PRINT_LISTS: determines if the program should print initial and sorted lists with every algorithm

If you want to set PRINT_LISTS to TRUE, then set SIZE to a smaller value (i.e.: 25);

If configuration file can't be accesed, default values are:
100
TRUE


## Compilation
Uses GNU Pascal compiler:

	$ make all

Clean files:

	$ make clean
