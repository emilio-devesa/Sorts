module BubbleSort;
{   This unit provides two implementations of the Bubble Sort algorithm:
        1. unoptimizedBubbleSort - the standard Bubble Sort
        2. optimizedBubbleSort - an optimized version with an early exit condition
    https://en.wikipedia.org/wiki/Bubble_sort
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

export  BubbleSort=(sort);

import  Configuration; List;

procedure sort(var l: tList; optimize: boolean);

end;

procedure unoptimizedBubbleSort (var l: tList);
var i,j: integer; aux: integer;
begin
    for j:=1 to SIZE do
        for i:=1 to SIZE-j do
            if (l[i]>l[i+1])
            then begin
                aux := l[i];
                l[i] := l[i+1];
                l[i+1] := aux;
            end;
end;

procedure optimizedBubbleSort (var l: tList);
var i,j: integer; aux: integer; sorted: boolean;
begin
    j:=1;
    repeat
        sorted:=true;
        for i:=1 to SIZE-j do
            if (l[i]>l[i+1])
            then begin
                aux:=l[i];
                l[i]:=l[i+1];
                l[i+1]:=aux;
                sorted:=false;
            end;
        j:=j+1;
    until (j>=SIZE) or (sorted);
end;

{ The main sorting procedure that calls either the optimized or unoptimized Bubble Sort }
procedure sort;
begin
	if optimize
	then optimizedBubbleSort(l)
    else unoptimizedBubbleSort(l);
end;

end.