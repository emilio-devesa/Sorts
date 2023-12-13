module InsertionSort;
{   This unit provides an implementation of the Insertion Sort algorithm
    https://en.wikipedia.org/wiki/Insertion_sort
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

export InsertionSort=(sort);

import  Configuration; List;

procedure sort(var l: tList);

end;

procedure sort;
var i, j, key: integer;
begin
    for j:=2 to SIZE do begin
        key:=l[j];
        i:=j-1;
        { Shift elements greater than the key to the right }
        while (i>0) and_then (l[i]>key) do begin
            l[i+1] := l[i];
            i:=i-1;
        end;
        { Insert the key into its correct position }
        l[i+1]:=key;
    end;
end;

end.