
Program SearchElement;

Const 
  //размерность массива
  Nmax = 4;

  //погрешность
  Eps = 1e-6;

  //точность представления данных
  Dig = 6;

Type 
  //тип индексов
  TIndex = 1..Nmax;
  //тип индексов строк
  TRowIndex = 1..Nmax;
  //тип индексов столбцов  
  TColIndex = 1..Nmax;
  //тип элементов массивов
  TElem = real;
  //тип одномерного массива
  TVector = array[TIndex] Of TElem;
  //тип двумерного массива
  TMatrix = array[TIndex] Of TVector;

Var 
  //i - индексная переменная для строк
  i: TRowIndex;
  //j - индексная переменная для столбцов
  j: TColIndex;

  //одномерный массив (вектор)
  MyVector: TVector;

  //двумерный массив (матрицы)
  MyMatrix: TMatrix;

  //искомый элемент
  K: TElem;

  //признак того, что элемент найден
  Flag: Boolean;
Begin
  //инициализация генератора псевдослучайных чисел
  randomize;


  //заполнение матрицы и вектора псевдослучайным данными
  For i:=1 To NMax Do
    For j:=1 To NMax Do
      MyMatrix[i, j] := random(10) / (random(5)+1);

  For i:=1 To NMax Do
    MyVector[i] := random(10) / (random(5)+1);

  //вывод элементов матрицы
  writeln('Матрица A:');
  For i:=1 To NMax Do
    Begin
      For j:=1 To NMax Do
        write(MyMatrix[i, j]:Dig+2:Dig);

      writeln;
    End;

  //вывод элементов массива
  writeln('Вектор V:');
  For i:=1 To NMax Do
    write(MyVector[i]:Dig+4:Dig);
  writeln;

  //поиск элемента массива
  writeln('Введите значение искомого элемента K:'
  );
  readln(K);

  //считаем, что элемент не найден
  Flag := false;
  
  For i:=1 To NMax Do
    //сравнение MyVector[i] и K    
    If abs(MyVector[i] - K) <= Eps Then 
      Begin
        //устанавливаем признак того, что нашли элемент
        Flag := true;
        
        writeln('Элемент ', K:Dig+4:Dig,
                ' в массиве найден на позиции ', i);
      End;

  //если элемент не найден, выводим информацию об этом
  If Not Flag Then
    writeln('Элемент ', K:Dig+4:Dig,
            ' в массиве не найден!');
End.
