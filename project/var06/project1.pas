 {$codepage utf8}
{************************************************************}
{                                                            }
{                 Проект HalfDivision                        }
{       Copyright (c) 2019  ФГБОУ РГРТУ им. В.Ф. Уткина      }
{                     ФВТ/кафедра КТ                         }
{                                                            }
{  Разработчик: ст. гр. 848 Сапунов Д.Р.                     }
{  Выполнен:  22.12.2019                                               }
{                                                            }
{************************************************************}
program Project1;

var
  Bx,By,   //координаты точек кривой

  t, ht,   //шаг

  P0x,P0y,P1x,P1y,P2x,P2y,P3x,P3y : extended;   //координаты опорных точек

  n: integer;   //номер точки

  t1, t2, t3: extended;   //замены выраженый

begin
  writeln('Добро пожаловать. Данная программа поможет Вам в построении Кривой Безье');
  writeln('========================================================================');
  writeln();

  writeln('Введите координату точки P0 в формате x y');
  readln(P0x,P0y);
  writeln('Введите координату точки P1 в формате x y');
  readln(P1x,P1y);
  writeln('Введите координату точки P2 в формате x y');
  readln(P2x,P2y);
  writeln('Введите координату точки P3 в формате x y');
  readln(P3x,P3y);
  writeln();

  writeln('Координаты ваших точек - P0-(',P0x:0:0,',',P0y:0:0,'), P1-(',P1x:0:0,',',P1y:0:0,'), P2-(',P2x:0:0,',',P2y:0:0,'), P3-(',P3x:0:0,',',P3y:0:0,')');
  writeln('Нажмите "Enter", чтобы продолжить');
  writeln();
  readln();

  writeln('В параметрической форме кубическая кривая Безье задаётся уравнением:');
  writeln('B(t)= (1-t)^3*P0+3t*(1-t)^2*P1+3t^2*(1-t)*P2+t^3*P3');
  writeln('Чтобы посчитать значение функции, нажмите "Enter"');
  readln();

  t := 0;   //задаём начальный параметр t
  ht := 0.05;   //задаём шаг параметра t

  n := 1;

  while t <= 1 do
  begin
    t1 := 1 - t;  //делаем замены для упрощения выражения
    t2 := t1 * t1;
    t3 := t2 * t1;

    Bx:= t3*P0x+3*t*t2*P1x+3*t*t*t1*P2x+t*t*t*P3x;   //считаем координату точки по иксу
    By:= t3*P0y+3*t*t2*P1y+3*t*t*t1*P2y+t*t*t*P3y;   //считаем координату точки по игреку

    writeln(n, ';', Bx:0:2, ';', By:0:2, ';');

    t:= t + ht;
    n := n + 1;
  end;
  writeln('Чтобы выйти из приложения, нажмите "Enter"');

  readln();

end.

