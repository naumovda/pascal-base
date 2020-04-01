program input_file_from_kbd;

type
  //тип элементов файла
  TElem = integer;

var
  //файловая переменная
  F: file of TElem;
  //имя файла
  FileName: string;
  //переменная
  Element: TElem;

begin
  //отключаем контроль операций ввода-вывода
  {$I-}

  write('Enter file name=');
  readln(FileName);

  //связываем файл с файловой переменной
  assign(F, FileName);
  //открываем файл для записи (создаем файл)
  rewrite(F);

  //проверяем, не было ли ошибки при создании файла
  if ioresult <> 0 then
  begin
    writeln('Error creating file!');

    halt;
  end;

  writeln('Input elements:');
  writeln('(split by enter key, any not number - ending input)');

  //вводим числовые данные
  repeat
    readln(Element);
    //если введено не число, прерываем цикл
    if ioresult <> 0 then
       break;
    //записываем данные в файл
    write(F, Element);
  until false;

  //закрываем файл

  close(F);
end.

