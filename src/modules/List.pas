module List;
{   List module
    Provides type tList and some basic operations
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

export  List=(tList, populate, copy, print);

import StandardOutput; Configuration;

type tList=array [1..SIZE] of integer;

procedure populate(var l: tList);
procedure copy(var listA, listB: tList);
procedure print(var l: tList);

end;

function getRandomInteger: integer;
var t: TimeStamp; seed: integer;
begin
    GetTimeStamp(t);
    seed:=t.Hour * 360000 + t.Minute * 6000 + t.Second * 100 + t.MicroSecond;
    getRandomInteger:=(seed mod SIZE) + 1;
end;

procedure populate;
var i: integer;
begin
    for i:=1 to SIZE do begin
        l[i]:=getRandomInteger;
    end;
end;

procedure copy;
var i: integer;
begin
    for i:=1 to SIZE do listB[i]:=listA[i];
end;

procedure print;
var i: integer;
begin
    write('[ ');
    for i:=1 to SIZE do begin
        write(l[i]:3,' ');
        if (i mod 10 = 0) and (i<SIZE)
        then begin
            writeln;
            write('  ');
        end;
    end;
    writeln('  ]');
end;

end.