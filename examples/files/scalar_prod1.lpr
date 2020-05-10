{$codepage utf8}
program scalar_prod1;

uses
  SysUtils;

const
  //имя файла для вывода логов
  LOG_FILE_NAME: string = 'log.txt';

  //ширина поля вывода числа
  WIDTH = 6;
  //точность числа при выводе
  PREC = 2;

  TAB = #9; //символ табуляции
  NEWLN = #10; //символ новой строки

  //ключи программы для вызова справки
  KEY_HLP_1: string = '\?';
  KEY_HLP_2: string = '\h';
  KEY_HLP_3: string = '\H';

  //строки для вывода информации
  MSG_TITLE: string = 'Программа вычисления скалярного произведения V1 x V2'
    + NEWLN + 'Для использования программы запустите ее с ключом \? или \h';
  MSG_VECTOR: string = 'Вектор';

  MSG_PRESS_ENTER: string = 'Для продолжения нажмите Enter...';

  MSG_HELP: string = 'Использование программы:' + NEWLN
    + TAB + 'vector_example file1 file2 result' + NEWLN
    + TAB + '- file1 - имя входного файла для вектора V1' + NEWLN
    + TAB + '- file2 - имя входного файла для вектора V2' + NEWLN
    + TAB + '- result - имя файла результатов';

  MSG_TASK_1: string = 'Вычисление скалярного произведения векторов' + NEWLN;
  MSG_TASK_2: string = 'Входные параметры: ';
  MSG_TASK_3: string = TAB + 'имя файла 1 : ';
  MSG_TASK_4: string = TAB + 'имя файла 2 : ';
  MSG_TASK_5: string = TAB + 'имя файла результатов :';

  MSG_ABORT: string = 'Аварийное завершение работы программы ';

  MSG_LOAD_OK: string = 'Данные вектора загружены успешно ';
  MSG_FILE_NOT_FOUND: string = 'Файл не найден ';
  MSG_READ_ERROR: string = 'Ошибка чтения из файла ';
  MSG_SIZE_ERROR: string = 'Неверное значение размера данных в файле ';
  MSG_UNKOWN_ERROR: string = 'Неизвестная ошибка при открытии файла ';
  MSG_SIZE_DIFF: string = 'Размерности векторов не совпадают ';
  MSG_CREATE_ERROR: string = 'Невозможно создать файл';
  MSG_WRITE_ERROR: string = 'Ошибка при записи данных в файл';

  MSG_CALC_SCALAR_1: string = 'Значение скалярного произведения = ';
  MSG_CALC_SCALAR_2: string = 'Скалярное произведение рассчитано и записано в файл ';

type
  //перечислимый тип для описания возможных типов ошибок
  //erOK - ошибок нет
  //erFileOpenFound - файл не найден
  //erIOError - ошибка ввода-вывода
  //erSizeError - неверный размер вектора
  TError = (erOK, erFileOpenFound, erIOError, erSizeError);

  TElem = double; //тип элементов
  TIndex = integer; //тип индексов
  TVector = array of TElem; //тип вектора
  TMatrix = array of TVector; //тип матрицы

//Чтение вектора из текстового файла
//Входные параметры
//  FileName: string - путь к файлу данных
//  var V:TVector - вектор, куда будут загружены данные
//Возвращаемые значения: признак ошибки типа TError
function ReadVector(FileName: string; var V:TVector):TError;
var
  F: Text;
  i: TIndex;
  Size: TIndex;
begin
  //связываем файл и файловую переменную
  Assign(F, FileName);
  {$I-}
  Reset(F); //открываем файл для чтения
  {$I+}
  if IOResult <> 0 then //если возникла ошибка, устанавливаем признак
  begin                 //и выходим из функции
    Result := erFileOpenFound;
    exit;
  end;

  //первый элемент, записанный в файл - это размер вектора
  Readln(F, Size);

  //если размер меньше 1, устанавливаем признак ошибки и выходим
  if Size < 1 then
  begin
    Result := erSizeError;
    exit;
  end;

  //задаем размер вектора
  SetLength(V, Size);

  //обнуляем все значения
  for i := 0 to Size-1 do
    V[i] := 0;

  //читаем данные из файла
  i := 0;
  while not Eof(F) do
  begin
    {$I-}
    Read(F, V[i]);
    {$I+}
    //если не удалось считать целое значение
    if IOResult <> 0 then
    begin
      Result := erIOError;
      exit;
    end;
    i := i + 1;
  end;

  //устанавливаем признак, что чтение завершилось успешно
  Result := erOK;

  //закрываем файл
  Close(F);
end;

//Чтение матрицы из текстового файла
//Входные параметры
//  FileName: string - путь к файлу данных
//  var M:TMatrix - матрица, куда будут загружены данные
//Возвращаемые значения: признак ошибки типа TError
function ReadMatrix(FileName: string; var M:TMatrix):TError;
var
  F: Text;
  i, j: TIndex;
  Rows, Cols: TIndex;
begin
  //связываем файл и файловую переменную
  Assign(F, FileName);
  {$I-}
  Reset(F); //открываем файл для чтения
  {$I+}
  if IOResult <> 0 then //если возникла ошибка, устанавливаем признак
  begin                 //и выходим из функции
    Result := erFileOpenFound;
    exit;
  end;

  //первый элемент, записанный в файл - это количество строк
  {$I-}
  Readln(F, Rows, Cols);
  {$I+}
  //если не удалось считать целое значение
  if IOResult <> 0 then
  begin
    Result := erIOError;
    exit;
  end;

  //если размер меньше 1, устанавливаем признак ошибки и выходим
  if (Rows < 1) or (Cols < 1) then
  begin
    Result := erSizeError;
    exit;
  end;

  //задаем размер вектора
  SetLength(M, Rows);

  //обнуляем все значения
  for i := 0 to Rows-1 do
    SetLength(M[i], Cols);

  //читаем данные из файла
  for i := 0 to Rows-1 do
  begin
    for j := 0 to Cols-1 do
    {$I-}
    Read(F, M[i][j]);
    {$I+}
    //если не удалось считать целое значение
    if IOResult <> 0 then
    begin
      Result := erIOError;
      exit;
    end;
  end;

  //устанавливаем признак, что чтение завершилось успешно
  Result := erOK;

  //закрываем файл
  Close(F);
end;

//Запись вектора в текстовый файл
//Входные параметры
//  var LogFile: Text - файл, куда будет проходить запись
//      Файл должен быть открыт для записи
//  const V:TVector - вектор, который будет выведен
//  MsgStr: string ='' - строка примечания, которая будет выведена до данных
//Возвращаемые значения: нет
procedure WriteVector(var LogFile: Text; const V:TVector; MsgStr: string ='');
var
  i: integer;
begin
  //выводим строку примечания
  if MsgStr <> '' then
    WriteLn(LogFile, MsgStr);

  //выводим в строку все элементы
  for i := 0 to High(V) do
    Write(LogFile, V[i]:WIDTH:PREC, ' ');
  WriteLn(LogFile);

  WriteLn(LogFile);
end;

//Запись матрицы в текстовый файл
//Входные параметры
//  var LogFile: Text - файл, куда будет проходить запись
//      Файл должен быть открыт для записи
//  const V:TVector - вектор, который будет выведен
//  MsgStr: string ='' - строка примечания, которая будет выведена до данных
//Возвращаемые значения: нет
procedure WriteVector(var LogFile: Text; const M:TMatrix; MsgStr: string ='');
var
  i, j: integer;
begin
  //выводим строку примечания
  if MsgStr <> '' then
    WriteLn(LogFile, MsgStr);

  //выводим в строку все элементы
  for i := 0 to High(M)-1 do
  begin
    for j := 0 to High(M[i])-1 do
      Write(LogFile, M[i][j]:WIDTH:PREC, ' ');
    WriteLn(LogFile);
  end;

  WriteLn(LogFile);
end;

//Вычисление скалярного произведения
//Входные параметры
//  const V1, V2: TVector - входные вектора
//Возвращаемое значение: скалярное произведение типа TElem
function ScalarProd(const V1, V2: TVector): TElem;
var
  i: TIndex;
  p: TElem;
begin
  p := 0;
  for i := 0 to High(V1) do
    p := p + V1[i]*V2[i];
  ScalarProd := p;
end;

//Запись описания задачи в текстовый файл
//Входные параметры: нет
//Возвращаемые значения: нет
procedure ShowTitle();
begin
  WriteLn(MSG_TITLE);
  WriteLn(MSG_PRESS_ENTER);
  Readln;
  halt(0);
end;

//Вывод на экран информации о программе
//Входные параметры: нет
//Возвращаемые значения: нет
procedure ShowHelp();
begin
  WriteLn(MSG_HELP);
  WriteLn(MSG_PRESS_ENTER);
  Readln;
  halt(0);
end;

//Открытие файла для логов
//Входные параметры
//  var F:Text - текстовый файл для вывода
//  DoRewrite: boolean=true - выполнять ли перезапись
//Возвращаемое значение: нет
procedure OpenLog(var F:Text; DoRewrite: boolean=true);
begin
  //открываем файл
  {$I-}
  if DoRewrite then
    Rewrite(F)
  else
    Append(F);
  {$I+}
  //если ошибка - выводим на экран текст сообщения
  if IOResult <> 0 then
  begin
    Writeln(MSG_CREATE_ERROR);
    Writeln(MSG_ABORT);
    halt(1);
  end;
end;

//Запись данных в лог
//Входные параметры
//  var F:Text - текстовый файл для вывода
//  MsgStr: string - строка для вывода
//  NewLine: boolean=true - выводить ли символ новой строки
//Возвращаемое значение: нет
procedure WriteToLog(var F:Text; MsgStr: string; NewLine: boolean=true);
begin
  if NewLine then
    Writeln(F, MsgStr)
  else
    Write(F, MsgStr);
end;

//Закрытие файла логов
//Входные параметры
//  var F:Text - текстовый файл
//Возвращаемое значение: нет
procedure CloseLog(var F:Text);
begin
  Close(F);
end;

//Вставка новой строки в файл логов
//Входные параметры
//  var F:Text - текстовый файл
//Возвращаемое значение: нет
procedure InsertNewLine(var F:Text);
begin
  WriteToLog(F, '');
end;

//Аварийное завершение программы с выводом сообщения в файл логов
//Входные параметры
//  var F:Text - текстовый файл
//  MessageStr: string - строка для вывода
//Возвращаемое значение: нет
procedure Abort(var F:Text; MessageStr: string);
begin
  WriteToLog(F, MessageStr);
  WriteToLog(F, MSG_ABORT);
  CloseLog(F);
  halt(1);
end;

//Аварийное завершение программы с выводом сообщения в файл логов
//Входные параметры
//  var LogFile: Text - файл для вывода
//  FileName1, FileName2 - имена входных файлов
//  ResultFileName: string - иям выходного файла
//Возвращаемое значение: нет
procedure WriteHeadToFile(var LogFile: Text; FileName1, FileName2,
  ResultFileName: string);
begin
  WriteToLog(LogFile, MSG_TASK_1);
  WriteToLog(LogFile, MSG_TASK_2);
  WriteToLog(LogFile, MSG_TASK_3 + FileName1);
  WriteToLog(LogFile, MSG_TASK_4 + FileName2);
  WriteToLog(LogFile, MSG_TASK_5 + ResultFileName);
  InsertNewLine(LogFile);
end;

//Загрузка вектора из текстового файла и вывод процесса загрузки в лог
//Входные параметры
//  var LogFile: Text - файл логов
//  FileName: string - имя файла для загрузки данных вектора
//  var V:TVector - выходной вектор
//Возвращаемое значение: нет
procedure ReadVectorFromFile(var LogFile: Text; FileName: string; var V:TVector);
begin
  case ReadVector(FileName, V) of
  erOK:
    begin
      WriteToLog(LogFile, MSG_LOAD_OK);
      WriteVector(LogFile, V, MSG_VECTOR);
    end;
  erFileOpenFound:
    Abort(LogFile, MSG_FILE_NOT_FOUND + FileName);
  erIOError:
    Abort(LogFile, MSG_READ_ERROR + FileName);
  erSizeError:
    Abort(LogFile, MSG_SIZE_ERROR + FileName);
  else
    Abort(LogFile, MSG_UNKOWN_ERROR + FileName);
  end;
end;

//Расчет скалярного произведения и вывод процесса в текстовый файл
//Входные параметры
//  var LogFile: Text - файл логов
//  ResultFileName: string - имя файла результатов
//  var V1, V2:TVector - вектора для расчета произведений
//Возвращаемое значение: нет
procedure WriteScalarProdToFile(var LogFile: Text; ResultFileName: string;
  var V1, V2:TVector);
var
  Scalar: TElem;
  ResultFile: Text;
begin
  //если размерности не равны, завершаем программу
  if High(V1) <> High(V2) then
    Abort(LogFile, MSG_SIZE_DIFF);

  //вычисляем скалярное произведение
  Scalar := ScalarProd(V1, V2);

  //выводим результаты в файл
  Assign(ResultFile, ResultFileName);
  {$I-}
  Rewrite(ResultFile);
  {$I+}
  if IOResult <> 0 then
    Abort(LogFile, MSG_CREATE_ERROR + ResultFileName);

  {$I-}
  Writeln(ResultFile, Scalar);
  {$I+}
  if IOResult <> 0 then
    Abort(LogFile, MSG_WRITE_ERROR + ResultFileName);

  Close(ResultFile);

  //выводим в лог файл результаты расчета
  WriteToLog(LogFile, MSG_CALC_SCALAR_1);
  WriteToLog(LogFile, FloatToStrF(Scalar, ffFixed, 10, 2));

  WriteToLog(LogFile, MSG_CALC_SCALAR_2);
  WriteToLog(LogFile, ResultFileName);
end;

var
  LogFile: Text; //файл логов

  FileName1, //имя файла для вектора 1
  FileName2, //имя файла для вектора 2
  ResultFileName: string; //имя файла результатов

  V1, V2: TVector; //вектора
  M1: TMatrix; //матрица
  i, j: integer;
begin
  //обрабатываем параметры командной строки
  if ParamCount = 1 then
    if (ParamStr(1)=KEY_HLP_1)    //если программа запущена с ключом помощи
      or (ParamStr(1)=KEY_HLP_2)  // \? \h или \H
      or (ParamStr(1)=KEY_HLP_3) then
      ShowTitle //выводим информацию о запуске программы
    else
      ShowHelp  //выводим информации о параметрах командной строки
  else
    if ParamCount <> 3 then
      ShowTitle; //выводим информацию о запуске программы

  //получаем значения имен параметров входных файлов
  FileName1 := ParamStr(1);
  FileName2 := ParamStr(2);
  //получаем значения имени выходного файла
  ResultFileName := ParamStr(3);

  //открываем файл логов
  Assign(LogFile, LOG_FILE_NAME);
  OpenLog(LogFile);

  //выводим в файл заголовок о запуске программы
  WriteHeadToFile(LogFile, FileName1, FileName2, ResultFileName);

  //читаем вектор 1 из файла
  SetLength(V1, 0);
  ReadVectorFromFile(LogFile, FileName1, V1);
  //читаем вектор 2 из файла
  SetLength(V2, 0);
  ReadVectorFromFile(LogFile, FileName2, V2);

  //выводим в файл скалярное произведение
  WriteScalarProdToFile(LogFile, ResultFileName, V1, V2);

  //закрываем файл
  Close(LogFile);
end.

