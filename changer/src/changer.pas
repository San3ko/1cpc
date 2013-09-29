Program changer;
uses crt;
var	f:file of char;
	l:text;
	dir,lpath,endpath,pid,str2: string;
	i,n: byte;
Procedure getdir;
	begin
		if ParamStr(1) = '-dir' then
      		dir:=paramstr(2);
	end;
Procedure getpid;
	begin
		lpath:=(dir+'\lastpid.ini');
		assign (l, lpath);
			reset (l);
			readln (l, pid);
			readln (l, str2);
		close (l);
	end;
Procedure change;
	begin
		endpath:=(dir+'\'+pid+'\end.ini');
		assign (f, endpath);
			rewrite (f);
			write (f, '1');
		close (f);
	end;
begin
	getdir;
	getpid;
	change;
end.