program test;
uses crt;
var
    f: file of char;
    c: char;
    i, n: byte;
begin
   delay(10000);
   assign (f, 'c:\temp\update\end.ini');
   rewrite (f);
   write (f, '1');
   close (f);
   if ParamStr(1) = '-p1' then
    begin
    delay(20000);
    end;
end.