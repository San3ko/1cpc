program changer;
uses
  crt;
var
  f: file of char;
  l: text;
  dir, lpath, endpath, pid, str2: string;
  i, n: byte;

procedure getdir;
begin
  dir := paramstr(2);
  pid := paramstr(4);
end;

procedure change;
begin
  endpath := (dir + '\' + pid + '\end.ini');
  assign(f, endpath);
  rewrite(f);
  write(f, '1');
  close(f);
end;

begin
  getdir;
  change;
end.