const 
  n = 100;
var
  f: file of integer;
begin
  randomize;
  
  assign(f, 'in_01.dat');
  rewrite(f);
  
  for var i:=1 to n do
    write(f, random(100));  
  
  close(f);
end.