program output_to_text;

uses unit1;

const
  ELEM_ROW = 30;

type
  TElem = integer;

var
  //входной файл
  InputFile,
  //выходной файл
  DestFile: file of TElem;

  //текстовый файл для вывода информаци
  OutputFile: text;

  //имена файлов
  InputFileName,
  OutputFileName,
  DestFileName: string;

  //переменная для чтения
  elem: TElem;

  //счетчик
  i: integer;

  //значение минимального и максимального элементов
  min_value, max_value: TElem;
  //позиции минимального и максимального элементов
  min_pos, max_pos: longint;

  //признак пустого входного файла
  is_empty: boolean;
begin
  //вводим имена файлов
  write('Enter source file name:');
  readln(InputFileName);

  write('Enter destination file name:');
  readln(DestFileName);

  write('Enter log file name:');
  readln(OutputFileName);

  //связываем файлы и файловые переменные
  Assign(InputFile, InputFileName);
  {$I-}
  Reset(InputFile);
  {$I+}

  //проверяем, что входной файл существует
  if ioresult <> 0 then
  begin
       writeln('Error opening input file!');
       halt;
  end;

  Assign(OutputFile, OutputFileName);
  {$I-}
  Rewrite(OutputFile);
  {$I+}

  //проверяем, что выходной файл может быть создан
  if ioresult <> 0 then
  begin
       writeln('Error opening output file for rewrite!');
       halt;
  end;

  Assign(DestFile, DestFileName);
  {$I-}
  Rewrite(DestFile);
  {$I+}

  if ioresult <> 0 then
  begin
       writeln('Error opening destination file for rewrite!');
       halt;
  end;

  //читаем данные из входного файла
  writeln(OutputFile, 'Source file name:', InputFileName);
  writeln(OutputFile, 'Input data:');

  i := 1;
  while not EOF(InputFile) do
  begin
    //читаем данные из ELEM_ROW
    read(InputFile, elem);

    write(OutputFile, elem, ' ');

    //выводим содержимое по ELEM_ROW элементов в строке
    if i mod ELEM_ROW = 0 then
        writeln(OutputFile);

    inc(i);
  end;
  writeln(OutputFile);

  //найдем максимальный и минимальный элементы
  is_empty := True;

  //переносим указатель на текущую позициюю в начало файла
  Reset(InputFile); //можно было бы и seek(InputFile, 0)
  while not EOF(InputFile) do
  begin
    //читаем файл поэлементно
    read(InputFile, elem);

    //при чтении первого элемента считаем его и максимальным, и минимальным
    if is_empty then
    begin
      //устанавливаем начальные значения для минимума и максимума
      min_value := elem;
      max_value := elem;

      //сохраняем позиции минимального и максимального элементов
      min_pos := 0;
      max_pos := 0;

      //первый проход завершен
      is_empty := false;
    end;

    //если найден элемент больше максимального
    if elem > max_value then
    begin
      max_value := elem;
      max_pos := filepos(InputFile);
    end;

    //если найден элемент меньше минимального
    if elem < min_value then
    begin
      min_value := elem;
      min_pos := filepos(InputFile);
    end;
  end;

  if is_empty then
    writeln(OutputFile, 'Source file is empty')
  else
  begin
    writeln(OutputFile, 'Minimum element is ', min_value,
      ' in position ', min_pos);
    writeln(OutputFile, 'Maximum element is ', max_value,
      ' in position ', max_pos);
  end;

  //перепишем все данные из входного файла в выходной
  reset(InputFile);
  while not EOF(InputFile) do
  begin
      read(InputFile, elem);
      write(DestFile, elem);
  end;

  //переставим минимальный и максимальный элемент местами
  if min_pos <> max_pos then
  begin
    seek(DestFile, min_pos);
    write(DestFile, max_value);

    seek(DestFile, max_pos);
    write(DestFile, min_value);
  end;

  //закроем файлы
  close(DestFile);
  close(InputFile);

  //откроем выходной файл для чтения и прочитаем из него данные
  Reset(DestFile);

  writeln(OutputFile, 'Result data:');

  if EOF(DestFile) then
    writeln(OutputFile, 'Destination file is empty')
  else
  begin
    i := 1;
    while not EOF(DestFile) do
     begin
      read(DestFile, elem);
      write(OutputFile, elem, ' ');
      if i mod 30 = 0 then
        writeln(OutputFile);
      inc(i);
    end;
  end;
  writeln(OutputFile);

  //закрываем файлы
  close(DestFile);
  close(OutputFile);
end.

