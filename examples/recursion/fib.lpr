program Fib;

var
  n_count: integer; //счетчик итераций для рекурсивной функции
  f_values: array[2..40] of integer;

//Итерационная функция вычисления числа Фибоначчи
//Входные параметры:
//  n - номер числа (n>=0)
//Выходное значение:
//  f_iter - число Фибоначчи
function f_iter(n: integer): integer;
var
  i: integer;
  a, b, c: integer;
begin
  a := 1;
  b := 1;
  for i := 2 to n do
  begin
    c := b + a;
    a := b;
    b := c;
  end;
  f_iter := b;
end;

//Рекурсивная функция вычисления n-го
//числа Фибоначчи
//Входные параметры:
//  n - номер числа (n>=0)
//Выходное значение:
//  f_req - число Фибоначчи
//  n_count - глобальная переменная,
//            счетчик вызовов функции
function f_req(n: integer): integer;
begin
  inc(n_count);
  WriteLn('Call f (', n, ')');

  if (n = 0) or (n = 1) then //терминальная ситуация
    f_req := 1
  else
    f_req := f_req(n-1) + f_req(n-2)
end;


//Рекурсивная функция вычисления n-го числа Фибоначчи
//с использованием глобального массива
//Входные параметры:
//  n - номер числа (0<=n<=40)
//Выходное значение:
//  f_req_arr - число Фибоначчи
//  n_count - глобальная переменная,
//            счетчик вызовов функции
function f_req_arr(n: integer): integer;
begin
  inc(n_count);

  if (n = 0) or (n = 1) then //терминальная ситуация
    f_req_arr := 1
  else
    begin
      //если ранее значение f_values[n] не вычислялось, то вычисляем его
      if f_values[n] = -1 then
        f_values[n] := f_req_arr(n-1) + f_req_arr(n-2);

      //возвращаем значение, хранящееся в f_values[n]
      f_req_arr := f_values[n];
    end;
end;

//Функция вычисления n-го числа Фибоначчи с использованием глобального массива
//инициализируещая глобальный массив и вызывающая рекурсивную функцию
//Входные параметры:
//  n - номер числа (0<=n<=40)
//Выходное значение:
//  f_arr - число Фибоначчи
function f_arr(n: integer): integer;
var
  i: integer;
begin
  //инициализируем массив, который будет хранить результаты вычислений
  for i := 2 to n do
    f_values[i] := -1;

  //обращаемся к рекурсивной функции
  f_arr := f_req_arr(n);
end;

var
  n, fn: integer;

begin
  Write('Input n = ');
  ReadLn(n);

  //расчет при помощи рекурсивной функции
  n_count := 0;
  fn := f_req(n);
  WriteLn(n, '-th Fib number is ', fn);
  WriteLn('We need ', n_count, ' function call in requsive case!');
  WriteLn;

  {
  //расчет при помощи рекурсивной функции
  //с использованием вспомогательного глобального массива
  n_count := 0;
  fn := f_arr(n);
  WriteLn(n, '-th Fib number is ', fn);
  WriteLn('We need ', n_count, ' function call in reqursive with array case!');
  WriteLn;

  //расчет при помощи итерационного алгоритма
  WriteLn('Itarative calculation is more fast');
  WriteLn(n, '-th Fib number is ', f_iter(n));
  WriteLn;
  }

  WriteLn('Press Enter to quit...');
  readln;
end.

