var
  f: text;
  s: string; 
  m, n: integer;
  
  i, j: integer;
  
  v: array of real;
  //a: array of array of real;
begin
  assign(f, 'matrix.txt');
  reset(f);
  
  while not EOF(f) do
  begin
    readln(f, s);
    writeln(s);
  end;
  writeln;
  
  reset(f);
  
  readln(f, m);
  readln(f, n);
  
  writeln('m=',m);
  writeln('n=',n);
  
  SetLength(v, n);
  
  for j := 0 to n-1 do
  begin    
    try
      read(f, v[j]);      
    except
      writeln('Smth wrong!!!!');
    end;
  end; 
  
  writeln('first row:');
  
  for j := Low(v) to High(v) do
    write(v[j], ' ');
  
  writeln;
  
  //for i := 1 to m do
  //  for j := 1 to n do
  //     read(f, m);
  
  
  close(f);
end.