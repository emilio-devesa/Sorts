program Sorts;
{   Sorts
    Command Line program written in Pascal ISO 10206 (Extended Pascal) that explores Sorting algorithms
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

import  StandardInput; StandardOutput;
        Configuration;
        List;
        BubbleSort qualified;
        InsertionSort qualified;
        SelectionSort qualified;
        QuickSort qualified;
        MergeSort qualified;

const   TAB=chr(9);
        LF=chr(10);

var     l: tList;


{ Procedure to sort a list using a specified algorithm }
procedure SortList(var originalList: tList; algorithm: integer; optimized: boolean);
var startTimeStamp, endTimeStamp: TimeStamp; l: tList;
begin
    { Create a copy of the original list}
    List.copy(originalList, l);

    { Print the list initial status if PRINT_LISTS is true }
    if PRINT_LISTS
    then begin
        writeln('INITIAL LIST:');
        List.print(l);
    end;

    { Select the sorting algorithm based on the provided option
        1. Bubble Sort
        2. Insertion Sort
        3. Selection Sort
        4. Quick Sort
        5. Merge Sort
    }
    GetTimeStamp(startTimeStamp);
    case algorithm of
        1: BubbleSort.sort(l, optimized);
        2: InsertionSort.sort(l);
        3: SelectionSort.sort(l);
        4: QuickSort.sort(l, 1, SIZE);
        5: MergeSort.sort(l, 1, SIZE);
    end;
    GetTimeStamp(endTimeStamp);

    { Print the sorted list if PRINT_LISTS is true }
    if PRINT_LISTS
    then begin
        writeln('SORTED LIST:');
        List.print(l);
    end;

    { Print the time taken for sorting and prompt for user input }
    writeln('Time: ', Time(startTimeStamp), ' -> ', Time(endTimeStamp));
    write('Press ENTER...');
    readln;
    writeln;
end;


begin
    writeln('Sort algorithms:');
    writeln('bubbleSort | insertionSort | selectionSort | quickSort | mergeSort',LF);

    if (PRINT_LISTS)
    then writeln('Lists will be printed')
    else writeln('Lists will not be printed');
    writeln('Populating (0-',SIZE:0,')...',LF);

    List.populate(l);
    
    writeln('Sorting list with bubbleSort');
    SortList(l, 1, false);
    
    writeln('Sorting list with bubbleSort (with optimization)');
    SortList(l, 1, true);

    writeln('Sorting list with insertionSort');
    SortList(l, 2, false);

    writeln('Sorting list with selectionSort');
    SortList(l, 3, false);

    writeln('Sorting list with quickSort');
    SortList(l, 4, false);

    writeln('Sorting list with mergeSort');
    SortList(l, 5, false);

end.