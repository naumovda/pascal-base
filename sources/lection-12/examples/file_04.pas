const 
 k = 10;
var
  f: text;
  s: string; 
  m, n: integer;
  
  i, j: integer;
  
  //v: array of real;
  //a: array of array of real;
  a: array[1..k, 1..k] real;
begin
  assign(f, 'matrix.txt');
  {reset(f);
  
  while not EOF(f) do
  begin
    readln(f, s);
    writeln(s);
  end;
  writeln;}
  
  reset(f);
  
  readln(f, m);
  readln(f, n);
  
  writeln('m=',m);
  writeln('n=',n);
  
  for i := 1 to m do
    for j := 1 to n do
       read(f, a[i,j]);  
  
  close(f);
end.