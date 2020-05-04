program quicksort;

const
  MIN_IDX = 1;
  MAX_IDX = 20000;

type
  TElem = integer;
  TIndex = MIN_IDX..MAX_IDX;
  TArray = array[TIndex] of TElem;

function IsSorted(var A: TArray; low, high: TIndex): boolean;
var
  i: integer;
begin
  i := low;
  while (i < high) and (A[i] <= A[i+1]) do
    i := i + 1;

  IsSorted := i = high;
end;

function DoPartition(var A: TArray; low, high: TIndex): TIndex;
var
  i, j, pivot: TIndex;
  tmp: TElem;
begin
  pivot := A[(low+high) div 2];

  i := low;
  j := high;

  while true do
  begin
    while A[i] < pivot do
      i := i + 1;

    while A[j] > pivot do
      j := j - 1;

    if i >= j then
    begin
      DoPartition := j;
      exit;
    end;

    tmp := A[i];
    A[i] := A[j];
    A[j] := tmp;
    i := i + 1;
    j := j - 1;
  end;
end;

procedure QuickSort(var A: TArray; low, high: TIndex);
var
  p: TElem;
begin
  writeln('l=', low, ' h=', high);

  if low < high then
  begin
    p := DoPartition(A, low, high);

    if p > low then
      QuickSort(A, low, p);

    if high > p+1 then
      QuickSort(A, p+1, high);
  end;
end;

var
  v: TArray;
  i, low, high: TIndex;

begin
  low := MIN_IDX;
  high := MAX_IDX;

  randomize;
  for i := low to high do
    v[i] := random(100);

  writeln('before sort:');
  for i := low to high do
    write(v[i], ' ');
  writeln;

  QuickSort(v, low, high);

  writeln('after sort:');
  for i := low to high do
    write(v[i], ' ');
  writeln;
  writeln('is sorted?=', IsSorted(v, low, high));
end.

