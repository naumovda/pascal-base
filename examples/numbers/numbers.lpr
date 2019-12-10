program numbers;

{
1234567654321
12         21
1 3       3 1
1  4     4  1
1   5   5   1
1    6 6    1
1     7     1
1    6 6    1
1   5   5   1
1  4     4  1
1 3       3 1
12         21
1234567654321
}

var
  i, n: byte;

begin
  write('Enter figure size (1..9):' );
  readln(n);

  for i := 1 to n do
    write(i);
  for i := n-1 downto 1 do
    write(i);
  writeln;

  for i := 2 to n-1 do
  begin
    write(1);
    write(i:i-1);
    write(i:2*n-2*i);
    write(1:i-1);
    writeln;
  end;

  writeln(1, n:n-1, 1:n-1);

  for i := n-1 downto 2 do
  begin
    write(1);
    write(i:i-1);
    write(i:2*n-2*i);
    write(1:i-1);
    writeln;
  end;

  for i := 1 to n do
    write(i);
  for i := n-1 downto 1 do
    write(i);
  writeln;

  readln;
end.

