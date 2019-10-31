program ex_05_01;

var
  i, j : byte;

begin
  write(' ':4);
  for i := 1 to 10 do
      write(i:4);
  writeln;

  for i := 1 to 11 do
      write('----':4);
  writeln;

  for i := 1 to 10 do
  begin
      write(i:3, '|');
      for j := 1 to 10 do
          write(i*j:4);
      writeln;
  end;

  readln;
end.

