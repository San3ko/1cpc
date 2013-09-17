program test;
var
    f: file of char;
    c: char;
    i, n: byte;
begin
   if ParamStr(1) = 'p1' then
    begin
      assign (f, 'c:\temp\update\end.ini');
      rewrite (f);
      write (f, '1');
      close (f);
   end;
end.