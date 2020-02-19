{************************************************************}
{                                                            }
{                 Проект Newton polynomial                   }
{       Copyright (c) 2019  ФГБОУ РГРТУ им. В.Ф. Уткина      }
{                     ФВТ/кафедра КТ                         }
{                                                            }
{  Разработчик: ст. гр. 848 Зайцев А.Р.                      }
{  Модифицирован: 19 декабря 2019                            }
{                                                            }
{************************************************************}
program Newton_polynomial;

//установка кодовой страницы для отображения русских символов
{$codepage utf8}

const
  NMAX = 20;

type
  TArr = array[1..NMAX] of double;

function f(x: double): double;
begin
  f := x*x+2*x+4;
end;

var
   x, y: TArr;

   y1: TArr;
   y2: TArr;
   y3: TArr;

   i, n, k: byte;

   xi, x0, xn, hx, xki: double;
   xk, q, otv: double;
begin
  writeln('Программа для интерполяции математической функции методом конечных разностей');
  repeat
  write('Начальное значение x0 = '); readln(x0);
  write('Конечное значение xi = '); readln(xn);
             if x0>xn then
             writeln('Неверное значение функции. Начальное значение промежутка не может быть больше конечного')
  until x0<xn;
   write('Шаг hx = '); readln(hx);

  n := 1;
  xi := x0;
  while xi <= xn do
  begin
    x[n] := xi;
    y[n] := f(xi);

    n := n + 1;
    xi := xi + hx;

    if n > NMAX then // Защита от переполнения массива
    begin
      n := n - 1;
      break;
    end;
  end;


  writeln ('Заданные значения узлов:');
     writeln ('№ |    x  |   y ');
     writeln ('-----------------');

for i:=1 to n do
    writeln (i-1,' | ', x[i]:3:2,' | ', y[i]:3:2);
writeln();

writeln ('Разности первого порядка: ');
    for i:=1 to n-1 do
        begin
             y1[i]:=y[i+1]-y[i];
             writeln(' y1= ', y1[i]:4:2);
        end;
writeln;

writeln ('Разности второго порядка: ');
    for i:=1 to n-2 do
        begin
        y2[i]:=y1[i+1]-y1[i];
        writeln(' y2= ',y2[i]:4:2);
        end;
writeln();

writeln ('Разности третьего порядка: ');
        for i:=1 to n-3 do
        begin
             y3[i]:=y2[i+1]-y2[i];
             writeln(' y3= ',y3[i]:4:2);
        end;
writeln;

writeln ('Заданные значения узлов:');
writeln ('№ |   x  |  y    | y1    | y2   | y3 ');
writeln ('----------------------------------------');

for i := 1 to n do
begin
  write(i-1,' | ', x[i]:2:2,' | ', y[i]:2:2, '  | ');

  if i < n then
    write(y1[i]:2:2, ' | ');
  if i < n - 1 then
    write(y2[i]:2:2, ' | ');
  if i < n - 2 then
    write(y3[i]:2:2);
  writeln;
end;

k:= n;

repeat
      if n>NMAX then
writeln('Для вычисления функции в точке введите X, который может принимать значения от ', x0:2:2,' до ', x[i]:2:2)
      else
writeln('Для вычисления функции в точке введите X, который может принимать значения от ', x0:2:2, ' до ', xi-1:2:2);
write('X = ');
read(xk);
writeln('Введённое значение X = ', xk:2:2);
writeln('Имеемый шаг таблицы = ', hx:3:3);

      if (x0<=xk) and (xk<=xi)  then
         begin
           writeln('Применяем прямую интерполяционную формулу Ньютона...');

               for i:=1 to k-1 do
                   begin
                        if (xk>x[i]) then
                               k := k+1
                        else
                            begin
                            xki := x[i];
                            break;
                            end;

                   end;

                    {writeln('Ближайшее к введённому X значение x0, которое будем использовать в формуле  = ', xki:2:2);
                    q:=((xk-xki)/hx);
                    writeln('q = ', q:2:2);
                    otv := y[i]+y1[i]*q+y2[i]*(q*(q-1))/2+y3[i]*(q*(q-1)*(q-2))/6;

                           writeln('Значение f(X) в введённой точке ', xk:2:2,' = ', otv:2:2);}
               readln();
               writeln('Нажмите ENTER для выхода из программы');
         end
      else
      writeln('Ошибка. Введите значение входящее в промежуток');
until (x0<=xk) AND (xk<=xi);
writeln('Ближайшее к введённому X значение x0, которое будем использовать в формуле  = ', xki:2:2);
                    q:=((xk-xki)/hx);
                    writeln('q = ', q:2:2);
                    otv := y[i]+y1[i]*q+y2[i]*(q*(q-1))/2+y3[i]*(q*(q-1)*(q-2))/6;

                           writeln('Значение f(X) в введённой точке ', xk:2:2,' = ', otv:2:2);
                           readln();
end.
