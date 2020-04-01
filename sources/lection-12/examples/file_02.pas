var
  f: file of integer;
  k: integer;
begin
  assign(f, 'in_01.dat');
  reset(f);
  
  while not EOF(f) do
  begin
    read(f, k);
    write(k, ' ');
  end;
  writeln;
  
  close(f);
end.