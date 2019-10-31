program ex_05_04;

var
  a1,a2,a3,a4,a5,a6: byte;

  s, g: longint;

begin
  s := 0;

  for g := 1 to 999999 do
  begin
       a1 := g mod 10;
       a2 := g div 10 mod 10;
       a3 := g div 100 mod 10;
       a4 := g div 1000 mod 10;
       a5 := g div 10000 mod 10;
       a6 := g div 100000 mod 10;
       if a1+a2+a3=a4+a5+a6 then s := s + 1;
  end;

  writeln(s);
  readln;
end.

