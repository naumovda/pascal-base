// расчет суммы бесконечного ряда S(x) = sum(f_n(x)) = sum(x^n/n!)
// ряд является разложением в ряд Тейлора функции exp(x)
// exp(x) = 1 + x/1! + x^2/2! +...+x^n/n!
program ex05_01;

const
  DIGITS = 5;     //количество знаков после запятой при выводе значений
  EPS = 1e-4;     //погрешность вычислений
  MAX_ITER = 100; //максимальное количество итераций

var
  n: integer;     //счетчик итераций
  f: extended;    //значение члена ряда f_n(x)
  s: extended;    //значение частичной суммы ряда
  x: extended;    //значение аргумента

begin
  //ввод исходных данных
  writeln('calculating sum of infinite seq S(x) = sum(f_n(x)) = sum(x^n/n!)');
  writeln('sequence if a Taylor series of function exp(x)');
  writeln('exp(x) = 1 + x/1! + x^2/2! +...+x^n/n!');
  writeln;
  write('input x = ');
  readln(x);

  //эхо-печать исходных данных
  writeln('source data for calculation');
  writeln('  value of x          = ', x:0:DIGITS);
  writeln('  error is            = ', eps:0:DIGITS);
  writeln('  max iteration count = ', MAX_ITER);

  n := 0; //начальное значение индекса
  f := 1; //начальное значение f_0(x)
  s := f; //начальное значение суммы ряда
  repeat
    n := n + 1; //увеличиваем счетчик
    f := f*x/n; //вычисляем следующее значение члена ряда
    s := s + f; //увеличиваем сумму
  until
    (abs(f) < EPS)       //пока не достугнута заданная точность
    or (n > MAX_ITER); //либо превышено максимальное число итераций

  //печать результатов расчета
  writeln('calculation results');
  writeln('  sum of series   = ', s:0:DIGITS);
  writeln('  iteration count = ', n);
  writeln('  exp(x)          = ', exp(x):0:DIGITS);
  writeln('  |s-exp(x)|      =', abs(s-exp(x)));

  readln;
end.

