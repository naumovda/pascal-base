program lec02_ex01_equation;

const
  DEBUG = true; //выводить ли на экран
                //промежуточные результаты

var
  //исходные данные
  a, b, c, d: double;
  //результат вычислений
  x1, x2: double;

begin
  //ввод исходных данных
  writeln('Нахождение корней квадратного уравнения');
  writeln('  ax^2+bx+c=0, a<>0');
  writeln('Введите значения коэффициентов a, b, c');
  write('  a = ');
  readln(a);
  write('  b = ');
  readln(b);
  write('  c = ');
  readln(c);

  assert(a <> 0, 'Error input data (a=0)');

  //эхо-печать исходных данных
  writeln('Введены значения');
  writeln('  a = ', a:10:4);
  writeln('  b = ', b:10:4);
  writeln('  c = ', c:10:4);

  //расчет определителя
  d := b*b - 4*a*c;

  //вывод промежуточных результатов
  if DEBUG then
     writeln('  d = ', d);

  writeln;
  if d < 0 then
    writeln('Действительных корней нет')
  else
    begin
      x1 := (-b - sqrt(d))/(2*a);
      x2 := (-b + sqrt(d))/(2*a);

      writeln('Значения корней уравнения');
      writeln('  x1 = ', x1:10:4);
      writeln('  x2 = ', x2:10:4);
    end;

  writeln('Для завершения работы нажмите Enter');
  readln;
end.

