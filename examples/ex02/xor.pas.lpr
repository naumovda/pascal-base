program test_xor;

var
  x, y: word;
begin
  x := 10;
  y := 230;

  writeln('x = ', x);
  writeln('y = ', y);

  x := x xor y;
  y := x xor y;
  x := x xor y;

  writeln('x = ', x);
  writeln('y = ', y);

  readln;
end.

