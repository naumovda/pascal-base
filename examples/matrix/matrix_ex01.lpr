program matrix_ex01;

const
  ROWS = 3;
  COLS = 4;

type
  TElem = integer;
  TResult = double;
  TRowIndex = 1..ROWS;
  TColIndex = 1..COLS;
  TRow = array[TColIndex] of TElem;
  TCol = array[TRowIndex] of TElem;
  TMatrix = array[TRowIndex] of TRow;

procedure MatrixFillRandom(var M: TMatrix; RowCount: TRowIndex; ColCount: TColIndex;
  RandomLeft, RandomRight: TElem);
var
  i: TRowIndex;
  j: TColIndex;
begin
  for i := 1 to RowCount do
    for j := 1 to ColCount do
      M[i][j] := random(RandomRight-RandomLeft+1)+RandomLeft;
end;

procedure MatrixOutput(const M: TMatrix; RowCount: TRowIndex; ColCount: TColIndex);
var
  i: TRowIndex;
  j: TColIndex;
begin
  for i := 1 to RowCount do
  begin
    for j := 1 to ColCount do
      write(M[i,j]:4);
    writeln;
  end;
end;

function CalcRowSum(const M: TMatrix; RowIndex: TRowIndex; ColCount: TColIndex): TResult;
var
  j: TColIndex;
  sum: TResult;
begin
  sum := 0;
  for j := 1 to ColCount do
    sum := sum + M[RowIndex, j];
  CalcRowSum := sum;
end;

procedure SwapMatrixRows(var M: TMatrix; Row1, Row2: TRowIndex);
var
  j: TColIndex;
  r: TRow;
begin
  r := M[Row1];
  M[Row1] := M[Row2];
  M[Row2] := r;
end;

procedure SortMatrixRowsBySum(var M: TMatrix; RowCount: TRowIndex; ColCount: TColIndex);
var
  i, j: TRowCount;
begin
  for i := 1 to RowCount-1 do
    for j := i+1 to RowCount do
      if CalcRowSum(M, i, ColCount) > CalcRowSum(M, i, ColCount) then
        SwapMatrixRows(M, i, j);
end;


end.

