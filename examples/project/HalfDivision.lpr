{************************************************************}
{                                                            }
{                 Проект HalfDivision                        }
{       Copyright (c) 2019  ФГБОУ РГРТУ им. В.Ф. Уткина      }
{                     ФВТ/кафедра КТ                         }
{                                                            }
{  Разработчик: ст. гр. 848 Иванов И.И.                      }
{  Модифицирован: 25 ноября 2019                             }
{                                                            }
{************************************************************}
program HalfDivision;

//установка кодовой страницы для отображения русских символов
{$codepage utf8}

type
  //тип данных для вычислений
  TValue = Double;

const
  EPS_X = 1e-6; //точность интервала уточнения корня
  EPS_Y = 1e-5; //точность вычисления корня
  MAX_ITER_COUNT = 100; //максимальное количество итераций

//функция для уточнения корня
//  x - аргумент фукнкции
//  результат - значение exp(x/10)*cos(x+Pi/3)
function f(x: TValue): TValue;
begin
  f := exp(x/10)*cos(x+Pi/3);
  //f := (x-2)*(x+3);
end;

var
  Left, Right: TValue;  //границы интервала
  Middle : TValue;      //центр интервала

  IterCount: word;      // счетчик итераций
  IsCorrect: boolean;   // признак корректности ввода

begin
  writeln('Программа для уточнения корня уравнения методом половинного деления');
//  writeln('Уравнение: (x-2)*(x+3) = 0)');
  writeln('Уравнение: exp(x/10)*cos(x+Pi/3) = 0)');
  writeln('*******************************************************************');
  writeln('Параметры алгоритма:');
  writeln('  Точность интервала уточнения корня EpsX = ', EPS_X:0:8);
  writeln('  Точность вычисления корня EpsY = ', EPS_Y:0:8);
  writeln('  Максимальное количество итераций = ', MAX_ITER_COUNT);
  writeln('*******************************************************************');
  writeln('Введите данные для расчета:');

  repeat
    IsCorrect := true;
    write('  Левая граница интервала Left = ');
    readln(Left);
    write('  Правая граница интервала Right = ');
    readln(Right);

    if Left > Right then
    begin
      IsCorrect := false;
      writeln('Ошибка! Правая граница меньше левой!');
      writeln('  Left = ', Left:0:8);
      writeln('  Right = ', Right:0:8);
      writeln('Повторите ввод');
    end;

    if f(Left)*f(Right) > 0 then
    begin
      IsCorrect := false;
      writeln('Ошибка! Значение функции на границах интервала одно знака!');
      writeln('  Left = ', Left:0:8);
      writeln('  Right = ', Right:0:8);
      writeln('  f(Left) = ', f(Left):0:8);
      writeln('  f(Right) = ', f(Right):0:8);
      writeln('Повторите ввод');
    end;
  until IsCorrect;

  writeln('*******************************************************************');
  writeln('Исходные данные:');
  writeln('  Левая граница интервала Left = ', Left:0:8);
  writeln('  Правая граница интервала Right = ', Right:0:8);

  IterCount := 0;
  repeat
    //вычисляем середину интервала
    Middle := Right/2 + Left/2;

    //определяем, в какой части лежит корень
    if f(Left)*f(Middle)<=0 then
      Right := Middle
    else
      Left := Middle;

    Inc(IterCount);
  until (IterCount = MAX_ITER_COUNT) //достигнуто максимальное количество итераций
        or (abs(Right-Left)<EPS_X)   //или достугнута точность по X
        or (abs(f(Middle))<EPS_Y);   //или достигнута точность по Y

  writeln('*******************************************************************');
  writeln('Результат расчета:');
  writeln('  Значение корня x = ', Middle:0:8);
  writeln('  Значение функции f(x) = ', f(Middle):0:8);
  writeln('  Количество итераций = ', IterCount);

  write('  Заданная точность ');
  if IterCount = MAX_ITER_COUNT then
    writeln('не достигнута')
  else
    write('достигнута');

  writeln;
  writeln('Для завершения работы нажмите Enter');
  readln;
end.

