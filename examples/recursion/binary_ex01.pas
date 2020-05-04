type
  TIndex = byte;
  TElem = byte;
  TArray = array [TIndex] of TElem;


function BinarySearch(const arr: TArray; const key: TElem; left, right: TIndex): TIndex;
var
  mid: TIndex;
begin
  mid := (right - left) div 2 + left;
  
  if arr[mid] = key then
    BinarySearch := mid
  else if arr[mid] < key then
  begin
    left := mid;
    BinarySearch := BinarySearch(arr, key, left, right);
  end
  else // arr[mid] > key
  begin
    right := mid;
    BinarySearch := BinarySearch(arr, key, left, right);  
  end;
end;

function LeftIdx(const arr: TArray; const key: TElem; left, right: TIndex; const Lborder: TIndex): TIndex;
var
  mid: TIndex;
begin
  mid := (right - left) div 2 + left;
  
  //terminate conditions:
  //arr[left] = key
  //arr[left-1] < key
  //[left] is min index (left = Lborder)
  
  if right - left = 1 then
  begin
    LeftIdx := right;
    exit;
  end;
  
  if (arr[left] = key) and ((arr[left - 1] < key) or (left = Lborder)) then
    LeftIdx := left
    else
  begin
    if arr[mid] >= key then
    begin
      right := mid;
      LeftIdx := LeftIdx(arr, key, left, right, Lborder);
    end
    else if arr[mid] < key then
    begin
      left := mid;
      LeftIdx := LeftIdx(arr, key, left, right, Lborder);
    end;
  end;
end;

function RightIdx(const arr: TArray; const key: TElem; left, right: TIndex; const Rborder: TIndex): TIndex;
var
  mid: TIndex;
begin
  mid := (right - left) div 2 + left;
  
  //terminate conditions:
  //arr[right] = key
  //arr[right+1] > key
  //[right] is max index (right = Rborder)
  
  if right - left = 1 then
  begin
    RightIdx := left;
    exit;
  end;
  
  if (arr[right] = key) and ( (arr[right+1] > key) or (right = Rborder) ) then
    RightIdx := right
  else
  begin
    if arr[mid] > key then
    begin
      right := mid;
      RightIdx := RightIdx(arr, key, left, right, Rborder);
    end
    else if arr[mid] <= key then
    begin
      left := mid;
      RightIdx := RightIdx(arr, key, left, right, Rborder);
    end;
    end;
end;

const
  Lborder = 0;
  Rborder = 14;
  Key = 10;

var
  arr: TArray;
  left, right: TIndex;

begin
  arr[0] := 1;
  arr[1] := 2;
  arr[2] := 2;
  arr[3] := 2;
  arr[4] := 2;
  arr[5] := 2;
  arr[6] := 5;
  arr[7] := 5;
  arr[8] := 5; 
  arr[9] := 10;
  arr[10] := 10;
  arr[11] := 10;
  arr[12] := 11;
  arr[13] := 11;
  arr[14] := 12;
  
  left := Lborder;
  right := Rborder;
  
  //writeln(BinarySearch(arr, 1, 0, 9));
  
  writeln(LeftIdx(arr, Key, left, right, Lborder));
  writeln(RightIdx(arr, Key, left, right, Rborder)); 
  
end.