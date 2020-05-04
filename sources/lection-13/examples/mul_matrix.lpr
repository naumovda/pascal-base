program mul_matrix;

const
  D = 6;
  P = 4;

type
  TElem = real;
  TVector = array of TElem;
  TMatrix = array of TVector;

function IOError(var ErrorCode): boolean;
begin
  if ioresult <> 0 then
    ErrorCode := -1;
  else
    ErrorCode := 0;

  IOError := ErrorCode <> 0;
end;

procedure InputMatrix(FileName: string; var Matrix: TMatrix;
  var ErrorCode: integer);
var
  F: Text;
  row, col: word;
begin
  Assign(F, FileName);
  {$I-}
  Reset(F);
  {$I+}

  if IOError(ErrorCode) then exit;

  readln(F, row);
  readln(F, col);

  SetLength(Matrix, row);

  for i := 0 to row do
  begin
    SetLength(Matrix[i], col);

    for j := 0 to col do
      read(F, Matrix[i][j]);

    readln(F);
  end;

  Close(F);
end;

procedure OutputMatrix(FileName: string; const Matrix: TMatrix;
  Message: string; var ErrorCode: integer);
var
  F: Text;
  row, col: word;
begin
  Assign(F, FileName);
  {$I-}
  Append(F);
  {$I+}

  if IOError(ErrorCode) then exit;

  writeln(F);
  writeln(F, Message);
  for i := Low(Matrix) to High(Matrix) do
  begin
    for j := Low(Matrix[i]) to High(Matrix[i]) do
      write(F, Matrix[i][j]:D:P, ' ');
    writeln(F);
  end;
  writeln(F);

  Close(F);
end;

procedure Mul(const A, B: TMatrix; var C:TMatrix; var ErrorCode: integer);
var
  i, j, k: word;

  row_a, col_a, row_b, col_b: word;
begin
  ErrorCode := 0;

  row_a := High(A);
  col_a := High(A[0]);

  row_b := High(B);
  col_b := High(B[0]);

  if col_a <> row_b then
  begin
    ErrorCode := -1;
  end;
end;

end.

