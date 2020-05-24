program binary_search_req;

type
  TArray = array of integer;

function search_req(const arr: TArray; left, right, key: integer): integer;
var
  middle: integer;
begin
  Writeln('find ', key, ' left = ', left, ' right = ', right);

  if right < left then
    search_req := -1
  else
    begin
      middle := left + (right - left) div 2; //(right + left) div 2;

      if arr[middle] = key then
        search_req := middle
      else
        if arr[middle] > key then
          search_req := search_req(arr, left, middle-1, key)
        else
          search_req := search_req(arr, middle+1, right, key);
    end;
end;

function search(const arr: TArray; key: integer): integer;
begin
  Result := search_req(arr, 0, length(arr), key);
end;

procedure print_array(const arr: TArray);
var
  i: integer;
begin
  for i := 0 to High(arr) do
    Write(arr[i], ' ');
  WriteLn;
end;

procedure test_search(const arr: TArray; key: integer);
var
  index: integer;
begin
  WriteLn('Trying to find ', key, ' in array: ');

  index := search(arr, key);

  WriteLn('Result index is ', index);
  WriteLn;
end;

var
  a: TArray;

begin
  a := TArray.Create(0, 1, 2, 2, 2, 4, 4, 5, 5, 5);

  Write('Array is ');
  print_array(a);

  //test_search(a, -1);
  //test_search(a, 0);
  test_search(a, 1);
  //test_search(a, 2);
  //test_search(a, 3);
  //test_search(a, 4);
  //test_search(a, 5);
  //test_search(a, 6);

  Write('Press Enter to quit...');
  ReadLn;
end.



