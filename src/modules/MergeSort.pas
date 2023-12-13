module MergeSort;
{   This unit provides an implementation of the Merge Sort algorithm
    https://en.wikipedia.org/wiki/Merge_sort
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}
export MergeSort=(sort);

import Configuration; List;

procedure sort(var l: tList; low, high: integer);

end;

{ Merge procedure to combine two sorted halves into a single sorted array }  
procedure merge(var l: tList; low, mid, high: integer);
var
i, j, k: integer;
temp: array[1..SIZE] of integer;
begin
    i:=low;
    j:=mid + 1;
    k:=low;

    { Compare elements from the two halves and merge them into the temporary array }
    while (i<=mid) and (j<=high) do begin
        if l[i]<l[j]
        then begin
            temp[k]:=l[i];
            i:=i+1;
        end
        else begin
            temp[k]:=l[j];
            j:=j+1;
        end;
        k:=k+1;
    end;

    { Copy any remaining elements from the first half to the temporary array }
    while i<=mid do begin
        temp[k]:=l[i];
        i:=i+1;
        k:=k+1;
    end;

    { Copy any remaining elements from the second half to the temporary array }
    while j<=high do begin
        temp[k]:=l[j];
        j:=j + 1;
        k:=k + 1;
    end;

    { Copy the sorted elements from the temporary array back to the original array }
    for k:=low to high do l[k]:=temp[k];
end;

procedure sort;
var mid: integer;
begin
    if (low<high)
    then begin
        { Calculate the middle index }
        mid:=(low + high) div 2;
        { Recursively sort the two halves }
        sort(l, low, mid);
        sort(l, mid + 1, high);
        { Merge the sorted halves }
        merge(l, low, mid, high);
    end;
end;

end.