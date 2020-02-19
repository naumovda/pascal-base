{************************************************************}
{                                                            }
{                     Проект PolinomNuytona                  }
{       Copyright (c) 2019  ФГБОУ РГРТУ им. В.Ф. Уткина      }
{                         ФВТ/кафедр КТ                      }
{                                                            }
{  Разработчик: студент гр.848 Елисеева Елизавета            }
{  Модифицирован: 15 декабря 2019                            }
{                                                            }
{************************************************************}

uses unit1;

var
  xi,yi:array [1..5] of real;
  y1: array [1..4] of real;
  y2: array [1..3] of real;
  y3: array [1..2] of real;
  i, a: integer;
  Pn ,x ,q ,b, hx: real;

begin
 writeln ('Заданные значения узлов:');
 writeln ('№ | x | y ');
 writeln ('---------------');
 xi[1]:=1.6; yi[1]:=1.6416;     //Присваивание значений переменным xi и yi
 xi[2]:=1.7; yi[2]:=2.3961;
 xi[3]:=1.8; yi[3]:=3.3536;
 xi[4]:=1.9; yi[4]:=4.5441;
 xi[5]:=2.0; yi[5]:=6.0000;

 for i:=1 to 5 do
  writeln (i-1,' | ', xi[i]:2:2,' | ', yi[i]:2:3); //Выводим значения переменных xi, yi

 writeln ('Разности первого порядка:');
 for i:=1 to 4 do
  begin
   y1[i]:=yi[i+1]-yi[i];
   write (' y1=', y1[i]:4:4); //Вывод разностей первого порядка
  end;
 writeln;

 writeln ('Разности второго порядка:');
 for i:=1 to 3 do
  begin
   y2[i]:=y1[i+1]-y1[i];
   write(' y2=',y2[i]:4:4); //Вывод разностей второго порядка
  end;
 writeln;

 writeln ('Разности третьего порядка:');
 for i:=1 to 2 do
  begin
   y3[i]:=y2[i+1]-y2[i];
   write(' y3=',y3[i]:4:4); //Вывод разностей третьего порядка
  end;
 writeln;

 writeln ('Введите значение переменной х:');
 readln (x);

 writeln ('Введите значение переменной hх:');  //Вводим значение шага сетки
 readln (hx);

 for i:=2 to 5 do
  if (x>xi[i-1]) and (x<xi[i]) then   //Проверяем введенное значение x

  begin
   a:=i-1;
   b:=xi[i-1];
   xi[1]:= xi[a];
  end;

 for i:=2 to 5 do
  xi[i]:=xi[1]+(i-1)*hx;
 writeln('Найденные значения x: ');

 for i:=1 to 5 do
  write(xi[i]:5:2);
 writeln;

 q:= (x - b)/hx;
 writeln('q = ',q:2:3);

 for i:= 1 to 5 do
  Pn:=yi[1]+q*y1[1]+y2[1]*((q*(q-1))/2)+y3[1]*((q*(q-1)*(q-2))/6);
 writeln ('Pn = ', Pn:4:4);
end.
