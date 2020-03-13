
Program Complex;

Type 
  TData = double;

  TComplex = Record
    Re, Im: TData;
    //Module, Arg: TData; 
  End;

  TComplexTrig = Record
    Module, Arg: TData;
  End;

Var 
  a, b, c, d, im: TComplex;
  at: TComplexTrig;

Begin
  if 
  
  function ParamCount: integer; 
  //      Возвращает количество параметров командной строки 
  
  function ParamStr(i: integer): string;
  //      Возвращает i-тый параметр командной строки

  //задать значение мнимой единицы
  im.Re := 0;
  im.Im := 1;

  a.Re := 10;
  a.Im := 12;
  b.Re := -20;
  b.Im := -4;

  {находим сумму}
  c.Re := a.Re + b.Re;
  c.Im := a.Im + b.Im;

  {находим произведение}
  d.Re := a.Re * b.Re - a.Im * b.Im;
  d.Im := a.Re * b.Im + a.Im * b.Re;

  {расчет модуля и аргумента числа a}

  a.Re := 1;
  a.Im := -1;

  at.Module := sqrt(a.Re*a.Re + a.Im*a.Im);

  If abs(a.Re) < 1e-6 Then
    Begin
      If a.Im > 0 Then
        at.Arg := Pi / 2
      Else
        at.Arg := - Pi / 2;
    End
  Else
    If a.Re > 0 Then
      at.Arg := arctan(a.Im / a.Re)
  Else If a.Re < 0 Then
         If a.Im >= 0 Then
           at.Arg := arctan(a.Im / a.Re) + Pi
  Else
    at.Arg := arctan(a.Im / a.Re) - Pi;

  writeln('mod:', at.Module:6:4, ' arg:', at.Arg);
End.
