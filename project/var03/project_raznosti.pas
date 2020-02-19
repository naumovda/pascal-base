
uses project_raznosti1;

function f(x: real) : real;
begin
  f := x*x*x - 3*x*x + 2*x + 1;
end;

const
  x0 = -4;
  xn = 4;
  hx = 0.1;
var
  x : real;

begin
  x := x0;

  while x <= xn do
  begin
    writeln(x:0:2, ';', f(x):0:4);
    x := x + hx;
  end;
end.
