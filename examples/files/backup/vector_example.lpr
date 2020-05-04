{$codepage utf8}
program vector_example;

const
  NMAX = 20;
  LOG_FILE_NAME = 'log.txt';
  WIDTH = 6;
  PREC = 2;

type
  TError = (erOK, erFileOpenFound, erIOError, erSizeError);

  TElem = double;
  TIndex = integer;
  TVector = array of TElem;

function ReadVector(FileName: string; var V:TVector; var Size: TIndex):TError;
var
  F: Text;
  i: TIndex;
begin
  Assign(F, FileName);
  {$I-}
  Reset(F);
  {$I+}
  if IOResult <> 0 then
  begin
    Result := erFileOpenFound;
    exit;
  end;

  Readln(F, Size);

  if Size < 1 then
  begin
    Result := erSizeError;
    exit;
  end;

  SetLength(V, Size);

  for i := 0 to Size-1 do
    V[i] := 0;

  i := 0;
  while not Eof(F) do
  begin
    {$I-}
    Read(F, V[i]);
    {$I+}
    if IOResult <> 0 then
    begin
      Result := erIOError;
      exit;
    end;
    i := i + 1;
  end;

  Result := erOK;

  Close(F);
end;

procedure WriteVector(var LogFile: Text; const V:TVector; MsgStr: string='');
var
  i: integer;
begin
  if MsgStr <> '' then
    WriteLn(LogFile, MsgStr);

  for i := 0 to High(V) do
    Write(LogFile, V[i]:WIDTH:PREC, ' ');

  WriteLn(LogFile);
end;

procedure ShowTitle();
begin
  WriteLn('Программа вычисления смешанного произведения V1 * V2 x V3');
  WriteLn('Для использования программы запустите ее с ключом \? или \h');
  WriteLn;
  Write('Для продолжения нажмите Enter...');
  Readln;
  exit;
end;

procedure ShowHelp();
begin
  WriteLn('Программа вычисления скалярного произведения V1 * V2');
  WriteLn('Использование программы:');
  WriteLn('  vector_example file1 file2 result');
  WriteLn('    - file1 - имя входного файла для вектора V1');
  WriteLn('    - file2 - имя входного файла для вектора V2');
  WriteLn('    - result - имя файла результатов');
  WriteLn;
  Write('Для продолжения нажмите Enter...');
  Readln;
  exit;
end;

function OpenLog(var F:Text; DoRewrite: boolean=true):TError;
begin
  Assign(F, LOG_FILE_NAME);
  if DoRewrite then
    Rewrite(F)
  else
    Append(F);
end;

procedure WriteToLog(var F:Text; MsgStr: string; NewLine: boolean=true);
begin
  if NewLine then
    Writeln(F, MsgStr)
  else
    Write(F, MsgStr);
end;

procedure CloseLog(var F:Text);
begin
  Close(F);
end;

var
  V1, V2, V3: TVector;
  LogFile: Text;

begin
  if ParamCount = 1 then
    if (ParamStr(1)='\?') or (ParamStr(1)='\h') then
      ShowTitle
    else
      ShowHelp
  else
    if ParamCount <> 3 then
      ShowTitle;

  OpenLog(LogFile);

  WriteToLog(LogFile, 'Вычсиление ');

  Close(LogFile);
end.


