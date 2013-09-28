program test;
uses crt;
var
    f: file of char;
    l: text;
    st,st2,dir1,dir2,dir: string;
    i, n: byte;
begin
   if ParamStr(1) = '-dir' then
   begin
      dir:=paramstr(2);
      dir1:=(dir+'\lastpid.ini');
    assign (l, dir1);
      reset (l);
      readln (l, st);
      readln (l, st2);
    close (l);
    dir2:=(st+'\'+st2+'\end.ini');
    delay(20);
    assign (f, dir2);
       rewrite (f);
       write (f, '1');
    close (f);
    end;
end.