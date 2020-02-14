
Program SortArray;

Const       
  //константы
  Nmax = 10;
  
  //размерность массива
  Dig = 2;
  
  //точность представления
  Debug = true;

Type 
  //тип индексов
  TIndex = 1..Nmax;

  TElem = real;
  TVector = array[TIndex] Of TElem;

Var 
  i, k : TIndex;  
  tmp: TElem;
  MyVector: TVector;

Begin
  //формируем значения элементов массива     
  For i:=1 To NMax Do
    MyVector[i] := random(10) / (random(5)+1);

  //вывод данных
  writeln('Вектор V до сортировки:');
  For i:=1 To NMax Do
    write(MyVector[i]:Dig+4:Dig);
  writeln;

  //сортировка
  For i:=1 To NMax-1 Do
    Begin
      For k:=i Downto 1 Do
        If MyVector[k] > MyVector[k+1] Then
          Begin
            tmp := MyVector[k];
            MyVector[k] := MyVector[k + 1];
            MyVector[k + 1] := tmp;
          End;

      //отладочная печать
      If Debug Then
        Begin
          writeln('Вектор V на итерации номер ', i);
          For k:=1 To NMax Do
            write(MyVector[k]:Dig+4:Dig);
          writeln;
        End;
    End;

  writeln('Вектор V после сортировки:');
  For i:=1 To NMax Do
    write(MyVector[i]:Dig+4:Dig);
  writeln;
End.
