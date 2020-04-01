{
	Работа с модулем ComplexUnit

	version 0.2
}

program ComplexProgram;

uses
  ComplexUnit; //подключаем модуль работы с комплексными числами
  
var
  a, b, c, d, e, f, g: TComplex;
begin
  //инициализруем а = 2+4i
  Init(2, 4, a);  
  //инициализруем b = -1+5i
  Init(-1, 5, b);  
  //инициализруем c = i
  c := C_IM_ONE;  
  //инициализруем e = 1
  e := C_ONE;
  
  //находим сумму двух чисел
  AddC(a, b, d);  
  //находим произведение двух чисел
  MulC(d, c, f);  
  //находим частное двух чисел
  DivC(e, f, g);
  
  //выводим числа
  writeln('A=');
  Out(a);
  writeln;
  
  //используем преобразование в строку
  writeln('B=', CToString(b));
  
  //выведем в экспоненциальной форме
  writeln('C=', CToStringForm(c, cofExp));
  
  //установим форму вывода по умолчанию как тригонометрическую
  SetDefaultForm(cofTrg);
  
  //теперь вывод будет в тригонометрической форме
  writeln('D=', CToString(d));
  
  //получим модуль и аргумент комплексного числа
  writeln;
  writeln('module D=', GetModule(d));
  writeln('argument D=', GetArgument(d));
  
  //все ли вычисления были допустимыми?
  writeln;
  writeln('Признак ошибки=', CGetError);
  writeln;
  
  //попробуем получить аргумент нуля
  writeln('argument (0,0)=', GetArgument(C_ZERO)); //получили значение 0, но..
  writeln(CGetErrorMessage); //установился признак ошибки
  CClearError; //сбрасываем признак ошибки  
end.