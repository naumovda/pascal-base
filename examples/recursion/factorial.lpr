program factorial;

//Функция расчета факториала
//при помощи нисходящей рекурсии
//
//Входные значения:
//  n - значение аргумента,
//      должно быть неотрицательным
//Входные значения:
//  f_down - значение факториала
function f_down(n: integer):integer;
var
  r: integer;
begin
  WriteLn('f_down (in) n = ', n);
  if n = 0 then //терминальная ситуация
    f_down := 1
  else
  begin
    //вычисление по формуле n! = n*(n-1)!
    r := n * f_down(n - 1);
    Writeln('Current result is = ', r);

    //f_down := n * f_down(n - 1);
    f_down := r;
  end;

  WriteLn('f_down (out) n = ', n);
end;

//Функция расчета факториала
//при помощи восходящей рекурсии
//
//Входные значения:
//  n - значение аргумента,
//      должно быть неотрицательным
//Входные значения:
//  res - накапливаемое значение факториала
procedure f_up(n: integer; var res: integer);
begin
  WriteLn('f_up (in) n = ', n);
  if n = 0 then //терминальная ситуация
    exit
  else
  begin
    Writeln('Current (in) result is = ', res);
    res := res * n;
    f_up(n-1, res);
    Writeln('Current (out) result is = ', res);
  end;
  WriteLn('f_up (out) n = ', n);
end;

var
  f, n: integer;

begin
  Write('Factorial calculation, input n = ');
  ReadLn(n);

  {
  Writeln('Using downward recursion');
  f := f_down(n);
  WriteLn('Result: ', n, '! is ', f);
  Writeln;
  }

  Write('Using upward recursion');
  //начальное значение f должно быть инициализированно
  f := 1;
  f_up(n, f);
  WriteLn('Result: ', n, '! is ', f);
  Writeln;

  Write('Press Enter to quit...');
  ReadLn;
end.

