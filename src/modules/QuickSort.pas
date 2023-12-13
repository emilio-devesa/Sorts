module QuickSort;
{   This unit provides an implementation of the Quick Sort algorithm
    https://en.wikipedia.org/wiki/Quicksort
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

export QuickSort=(sort);

import Configuration; List;

procedure sort(var l: tList; low, high: integer);

end;

procedure sort;
var i, j, pivot, aux: integer;
begin
    if low<high
    then begin
        { Choose the pivot (in this case, the middle element) }
        pivot:=l[(low + high) div 2];
        i:=low;
        j:=high;
        { Partition the array into two halves }
        repeat
            while l[i] < pivot do i:=i+1;
            while l[j] > pivot do j:=j-1;
            if i<=j
            then begin
                { Swap elements and move indices }
                aux:=l[i];
                l[i]:=l[j];
                l[j]:=aux;
                i:=i+1;
                j:=j-1;
            end;
        until i>j;
        { Recursively sort the sub-lists }
        sort(l, low, j);
        sort(l, i, high);
    end;
end;

end.