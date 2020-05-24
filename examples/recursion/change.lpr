program change;

var
  calls: integer;

function variants(sum: integer):integer;
  const
    NO_DATA = -1;
  var
    counts: array of integer;
    i: integer;
  function calc_variants(sum: integer):integer;
  begin
    inc(calls);
    if sum < 0 then
      calc_variants := 0
    else
      if sum = 0 then
        calc_variants := 1
      else
        begin
          if counts[sum] = NO_DATA then
            counts[sum] := calc_variants(sum-1) + calc_variants(sum-5) + calc_variants(sum-10);
          calc_variants := counts[sum];
        end;
  end;
  begin
    SetLength(counts, sum+1);
    for i := 0 to sum do
      counts[i] := NO_DATA;
    variants := calc_variants(sum);
  end;

function variants_req(sum: integer):integer;
begin
  inc(calls);

  if sum < 0 then
    variants_req := 0
  else
    if sum = 0 then
      variants_req := 1
    else
      variants_req := variants_req(sum-1) + variants_req(sum-5) + variants_req(sum-10);
end;

var
  sum, count: integer;

begin
  write('Enter sum value = ');
  readln(sum);

  calls := 0;
  count := variants(sum);
  writeln('Where ara ', count, ' variants of change of sum ', sum);
  writeln('Needed ', calls, ' calls of function');

  calls := 0;
  count := variants_req(sum);
  writeln('Where ara ', count, ' variants of change of sum ', sum);
  writeln('Needed ', calls, ' calls of requrrent function');

  writeln('Press Enter to quit...');
  readln;
end.

