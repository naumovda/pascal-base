program ex_05_03;

var
  x, x0, xn, hx,
  y, y0, yn, hy, z: extended;

begin
  write('Enter x0 = ');
  readln(x0);
  write('Enter xn = ');
  readln(xn);
  write('Enter hx = ');
  readln(hx);

  write('Enter y0 = ');
  readln(y0);
  write('Enter yn = ');
  readln(yn);
  write('Enter hy = ');
  readln(hy);

  x := x0;
  while x< xn do
  begin
       y := y0;
       while y<yn do
       begin
            z := cos(x) + sin(y);

            writeln('z(',x:0:2,',',y:0:2,')=',z:0:4);

            y := y + hy;
       end;
       x := x + hx;
  end;

  readln;
end.

