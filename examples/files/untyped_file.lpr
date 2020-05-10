program untyped_file;

const
  BUFFER_SIZE = 512; //размер буфера

type
  //типы ошибок:
  //erOK - нет ошибки
  //erReadError - ошибка при чтении данных
  //erWriteError - ошибка при записи данных
  TError = (erOK, erReadError, erWriteError);

var
  SourceFile, DestFile: file; //файловые переменные
  SourceFileName, DestFileName: string; //имена файлов
  ReadCount, WriteCount: word; //количество считанных и записанных данных
  Buffer: array[1..BUFFER_SIZE] of byte; // буфер
  Error: TError; //ошибка

begin
  Write('Enter Source file name: ');
  ReadLn(SourceFileName);
  Write('Enter Desination file name: ');
  Readln(DestFileName);

  Assign(SourceFile, SourceFileName);
  {$I-}Reset(SourceFile, 1);{$I+}
  if IOResult <> 0 then begin
    WriteLn('Error while opening file ', SourceFileName); Halt(1);
  end;

  Assign(DestFile, DestFileName);
  Rewrite(DestFile, 1);

  Error := erOK;
  repeat
    BlockRead(SourceFile, Buffer, BUFFER_SIZE, ReadCount);
    if ReadCount = 0 then
    begin
      Error := erReadError;
      break;
    end;

    BlockWrite(DestFile, Buffer, ReadCount, WriteCount);
    if ReadCount <> WriteCount then
    begin
      Error := erWriteError;
      break;
    end;
  until EOF(SourceFile);

  Close(SourceFile);
  Close(DestFile);

  case Error of
  erOk:
    WriteLn('Copying is completed');
  erReadError:
    WriteLn('Error while reading file ', SourceFileName);
  erWriteError:
    WriteLn('Error while writing file ', DestFileName);
  else
    WriteLn('Unknown Error');
  end;

  WriteLn('Press Enter to quit...');
  readln;
end.

