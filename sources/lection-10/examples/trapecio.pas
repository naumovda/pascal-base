program Trapecio;

const
  //погрешность вычислений
  EPS = 1e-6;
  
  //лимит шагов, в случае, если интеграл расходится
  LIMIT = 1e4;
  
  //первоначальное число шагов
  FIRST_STEP = 10;  
type
  //функциональный тип данных
  //вход:
  //  x - аргумент
  //выход:
  //  значение функции
  TFunction = function(x:real):real;

//функция синуса для интегрирования
//вход:
//  x - аргумент
//выход:
//  FSin - значение функции синуса
function FSin(x: real):real;
begin
  FSin := sin(x);
end;

//функция косинуса для интегрирования
//вход:
//  x - аргумент
//выход:
//  FCos - значение функции синуса
function FCos(x: real):real;
begin
  FCos := cos(x);
end;  

//функция численного интегрирования по формуле трапеций для 
//  заданного числа шагов
//вход:
//  F - функция для интегрирования
//  LimitA - нижний предел интегрирования 
//  LimitB - верхний предел интегрирования
//  Step - шагов разбиения интервала [LimitA..LimitB]
//выход:
//  CalcIntegralStep - значение интеграла
function CalcIntegralStep(F: TFunction; LimitA, LimitB, Step: real): real;
var
  s, x: real;  
  i, n: integer;
begin
  n := round((LimitB - LimitA) / Step); //получаем количество разбиений
  
  s := 0;  
  
  for i := 1 to n - 1 do
  begin
    x := LimitA + Step * i;    
    s := s + F(x); //обращаемся к параметру F функционального типа 
  end;
  
  CalcIntegralStep := Step * ((F(LimitA) + F(LimitB))/2 + s);
end;  

//функция численного интегрирования по формуле трапеций  
//  с заданной точностью EPS
//вход:
//  F - функция для интегрирования
//  LimitA - нижний предел интегрирования 
//  LimitB - верхний предел интегрирования
//выход:
//  CalcIntegral - значение интеграла
function CalcIntegral(F: TFunction; LimitA, LimitB:real): real;
var
  i: integer; //счетчик количества расчетов
  
  prev, //значение интеграла, подсчитанное на предыдущем этапе
  curr, //значение интеграла, подсчитанное на текущем этапе
  step: real; //шаг
begin  
  //расчет начального шага разбиения интервала
  step := (LimitB - LimitA) / FIRST_STEP;    
  
  i := 0;
  
  //рассчитываем первое начальное значение интеграла
  curr := CalcIntegralStep(F, LimitA, LimitB, step);
  
  repeat
    i := i + 1;       
    step := step / 2; //уменьшаем шаг вдвое
    prev := curr;     
    
    //расситываем интеграл с новым значением шага
    curr := CalcIntegralStep(F, LimitA, LimitB, step);    
  until 
    (abs(prev - curr) < EPS) //либо когда разность двух интегралов не станет                
    or (i > LIMIT);          //меньше погрешности, либо число повторений 
                             //превысит лимит
  
  CalcIntegral := curr;
end;  
  
var
  y1, y2: real;
begin
  writeln('Вычисление интегралов по формуле трапеций:');
  
  y1 := CalcIntegral(FSin, 0, Pi);
  y2 := CalcIntegral(FCos, 0, 2*Pi);
  
  writeln('sin(x), 0..Pi  :', y1:8:4);
  writeln('cos(x), 0..2*Pi:', y2:8:4);
end.