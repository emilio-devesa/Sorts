module Configuration;
{   Configuration module
    Provides program basic parameters from file 'Sorts.conf'
    
    Emilio Devesa
    https://emiliodevesa.wordpress.com/2023/12/13/sorts/
}

export Configuration=(SIZE, PRINT_LISTS);

var SIZE: integer value 100;
    PRINT_LISTS: boolean value TRUE;
    CONFIG_FILE: String (12) value 'Sorts.conf';

end;

type tTextFile = bindable text;

function exists(filename: String): boolean;
var b: bindingtype; f: tTextFile;
begin
    unbind(f);
    b:=binding (f);
    b.name:=filename;
    bind(f, b);
    b:=binding (f);
    exists:=b.existing;
end;

function binds(var f: tTextFile; filename: String): boolean;
var b: bindingtype;
begin
    unbind(f);
    b:=binding (f);
    b.name:=filename;
    bind(f, b);
    b:=binding(f);
    binds:=b.bound;
end;

procedure LoadConfiguration;
var confFile: tTextFile;
    tempValue: String(4);
begin
    { Open file in read mode }
    if exists(CONFIG_FILE) and_then binds(confFile, CONFIG_FILE)
    then begin
        {$i-} { Disable input error checking }
        reset(confFile);
        readln(confFile, SIZE);
        readln(confFile, tempValue);
        PRINT_LISTS:=tempValue='TRUE';
        {$i+} { Enable input error checking }
    end
end;

to begin do LoadConfiguration;

end.