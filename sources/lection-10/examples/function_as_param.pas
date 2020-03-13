program FunctionAsParam;
const       
  //константы
  Nmax = 10;  
  //размерность массива
  Dig = 2;  
  //точность представления
  Debug = true;
type 
  //тип индексов
  TIndex = 1..Nmax;
  //тип элементов
  TElem = real;
  //массив
  TVector = array[TIndex] Of TElem;
  
  //функция сравнения элементов массива
  //вход:
  //  FirstValue - первый сравниваемый элемент
  //  SecondValue - второй сравниваемый элемент
  //выход:
  //  boolean - признак того, что элементы в правильном порядке
  TCompareFunction = function(FirstValue, SecondValue: TElem):boolean;

//функция сравнения элементов массива для сортировки по возрастанию
//вход:
//  FirstValue - первый сравниваемый элемент
//  SecondValue - второй сравниваемый элемент
//выход:
//  SortAscending - признак того, что FirstValue <= SecondValue
function SortAscending(FirstValue, SecondValue: TElem):boolean;
begin
  SortAscending := FirstValue <= SecondValue;
end;

//функция сравнения элементов массива для сортировки по убыванию
//вход:
//  FirstValue - первый сравниваемый элемент
//  SecondValue - второй сравниваемый элемент
//выход:
//  SortDescending - признак того, что FirstValue >= SecondValue
function SortDescending(FirstValue, SecondValue: TElem):boolean;
begin
  SortDescending := FirstValue >= SecondValue;
end;

//процедура сортировки
//вход:
//  aVector - входной массив для сортировки
//  aCount - количество элементов массивов
//  aSortFunction - функция сортировки
//выход:
//  aVector - отсортированный массив
procedure Sort(var aVector: TVector; aCount: TIndex; aSortFunction: TCompareFunction);
var 
  i, k : TIndex;  
  tmp: TElem;
begin
  for i:=1 to NMax-1 do
      for k:=i downto 1 do
        //если значения расположены не в требуемом порядке
        if not aSortFunction(aVector[k], aVector[k+1]) then
          begin
            tmp := aVector[k];
            aVector[k] := aVector[k + 1];
            aVector[k + 1] := tmp;
          end;
end;

//процедура вывода массива на печать
//вход:
//  aVector - входной массив для сортировки
//  aCount - количество элементов массивов
//  Precision - количество знаков после запятой при выводе
//выход: -
procedure Output(const aVector: TVector; aCount: TIndex; Precision: byte);
var
  i: TIndex;
begin
  for i:=1 to aCount do
    write(aVector[i]:Precision+4:Precision);
  writeln;
end;

//процедура инициализации значений элементов массива псевдослучайными числами
//вход:
//  aVector - входной массив для сортировки
//  aCount - количество элементов массивов
//  Min, Max - границы диапазона для формирования элементов массива
//выход: -
//  aVector - выходной массив 
procedure Init(var aVector: TVector; aCount: TIndex; Min, Max: TElem);
var
  i: TIndex;
begin
  randomize;  
  
  for i:=1 to NMax do
    aVector[i] := random(Max - Min) + Min;
end;

var
  MyVector: TVector;
  
begin
  //формируем значения элементов массива     
  Init(MyVector, Nmax, 5, 10);

  //вывод данных
  writeln('Вектор V до сортировки:');
  Output(MyVector, NMax, Dig);

  //сортируем по возрастанию, передавая в качестве параметра 
  //функцию SortAscending
  Sort(MyVector, NMax, SortAscending);

  writeln('Вектор V после сортировки по возрастанию:');
  Output(MyVector, NMax, Dig);

  //сортируем по убыванию, передавая в качестве параметра 
  //функцию SortDescending  
  Sort(MyVector, NMax, SortDescending);
  
  writeln('Вектор V после сортировки по убыванию:');
  Output(MyVector, NMax, Dig);  
End.
