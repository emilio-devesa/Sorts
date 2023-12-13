module SelectionSort;
{   This unit provides an implementation of the Selection Sort algorithm
    https://en.wikipedia.org/wiki/Selection_sort
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

export SelectionSort=(sort);

import Configuration; List;

procedure sort(var l: tList);

end;

procedure sort;
var i, j, minIndex, aux: integer;
begin
    for i:=1 to SIZE-1 do begin
        minIndex:=i;
        { Find the index of the minimum element in the remaining unsorted portion }
        for j:=i+1 to SIZE do
            if l[j]<l[minIndex]
            then minIndex:=j;
        { Swap the found minimum element with the first element }
        if minIndex<>i
        then begin
          aux:=l[i];
          l[i]:=l[minIndex];
          l[minIndex]:=aux;
        end;
    end;
end;

end.