program test_mod_negative;

var
  x, y: integer;
begin
  x := 10;
  y := 9;

  writeln(' x mod  y',   x  mod   y :4);
  writeln('-x mod  y', (-x) mod   y :4);
  writeln(' x mod -y',   x  mod (-y):4);
  writeln('-x mod -y', (-x) mod (-y):4);

  readln;
end.

