program Project1;

{************************************************************}
{                                                            }
{                 Проект PolinomNuytona                      }
{       Copyright (c) 2019  ФГБОУ РГРТУ им. В.Ф. Уткина      }
{                     ФВТ/кафедр КТ                          }
{                                                            }
{  Разработчик: ст. гр. 848 Елисеева Е.В.                    }
{  Модифицирован: 19 декабря 2019                            }
{                                                            }
{*********************************************************************************}
program polinom;
//Установка кодовой страницы для отображения русских символов
{$codepage utf8}

const
  N_MAX = 100;   //Максимальное количество итераций
  MAX_ORDER = 5; //Максимальный порядок разностей

type
  //Тип данных для вычислений
  TValue = real;

function f(x: TValue) : TValue;
begin
  f : = x*x*x
  //Ввод произвольной функции
  //exp(x) * cos(x);
  //2*x*x*x*x - 3*x + 4;
  //f := 2*x*x*x*x - 3*x + 4;
  //f := x*x;
end;
var
  xi, yi: array [0..N_MAX] of TValue;
  d: array[1..MAX_ORDER, 0..N_MAX] of TValue;
  x, x0, xn, hx : TValue;
  i, j, n, k, v : integer;
  p, t : TValue;
  fres : text;

begin
  write (' x0 = ');  readln(x0);
  write (' xn = ');  readln(xn);
  write (' hx = ');  readln(hx);
  //Присваивание значений переменным xi и yi
  i : = 0;
  x : = x0;
  while x < xn do
  begin
    xi[i] : = x;
    yi[i] : = f(x);

    i : = i + 1;
    x : = x + hx;
  end;
  n : = i - 1;
  writeln ('Заданные значения узлов:');
  writeln ('№   |    x   |   y  ');
  writeln ('----------------------');
  for i : = 0 to n do
    writeln (i: 3,' | ', xi[i]: 6:2,' | ', yi[i]: 6:2); //Выводим значения переменных xi, yi

  for i := 0 to n - 1 do
    d[1, i] := (yi [i+1] – yi [i])/hx;

 //Формируем разность первого порядка
  writeln ('Разности первого порядка:');
  for i := 0 to n-1 do
    writeln(' y1 = ', d[1, i]: 0: 4, ' ');
  writeln;

  for j : = 2 to MAX_ORDER do
    for i : = 0 to n do
      d[j, i] : = 0;

  //Формируем разность порядка j
  for j : = 2 to MAX_ORDER do
    for i : = 0 to n - j do
      d[j, i] : = (d[j - 1, i + 1] - d[j - 1, i])/(j*hx);

  writeln ('Разности:');
  for j : = 1 to MAX_ORDER do
     write('   y', j,'   |');
  writeln;
  for i : = 0 to n do
    begin
      for j : = 1 to MAX_ORDER do
        if i > n – j + 1 then
          write(0.0:8:4, '|')
        else
          write(d[j, i]:8:4, '|');
      writeln;
    end;
 writeln;

 //Предлагаем пользователю выбрать режим дальнейшей работы
 repeat
   writeln('Введите режим расчета');
   writeln('  1 - одиночный расчет');
   writeln('  2 - табуирование, вывод на экран');
   writeln('  3 - табуирование, вывод в файл result.csv');
   writeln('  0 - выход');
   write('>');
   readln(v);

   if v = 1 then
   begin
     write('Введите значение переменной х:');
     readln(x);

     p : = yi[0];
     t : = 1;

     for k : = 0 to n-1 do
     begin
       t : = t * (x  -  xi[k]);
       p : = p + t * d[k + 1, 0];
     end;

     writeln ('P    = ', P:8:4);
     writeln ('f(x) = ', f(x): 8:4);

     writeln('Нажмите Enter...');
     //Возвращение к началу цикла
     readln;
   end
   else if (v = 2) or (v = 3) then
   begin
     if v = 3 then
     begin
      assign(fres, 'result.csv');
      //Связывает файловую переменную fres с физическим файлом result.csv
      rewrite(fres);
      //Открытие файла для записи в него информации
      writeln (fres,'x; f(x); pn(x)');
     end
     else
      writeln ('x; f(x); pn(x)');

     x : = x0; i : = 0;
     while x < xn do
     begin
       p := yi[0];
       t := 1;

       for k := 0 to n-1 do
       begin
         t := t * (x - xi[k]);
         p := p + t * d[k+1, 0];
       end;

       if v = 2 then
       begin
         write(x: 8:4, ';');
         write(f(x): 8:4, ';');
         writeln(p: 8:4);
       end
       else
       begin
         write(fres, x: 8:4, ';');
         write(fres, f(x): 8:4, ';');
         writeln(fres, p: 8:4);
       end;
       i : = i + 1;
       x : = x + hx;
     end;
     if v = 3 then
     begin
        close(fres);
        //Конец работы с файлом, закрытие файла
        writeln('Файл result.csv сформирован.');
     end;
     writeln('Нажмите Enter...');
     //Возвращение к началу цикла
     readln;
   end
  until v = 0; //Цикл выполняется до тех пор, пока пользователь не введет 0
end.

