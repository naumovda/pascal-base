program test_div_mod;

var
  d, s: word;
begin
  d := 923;

  s := (d mod 10)
    + d div 10 mod 10
    + d div 100 mod 10;

  writeln('D = ', d);
  writeln('sum of digits of D = ', s);

  readln;
end.

