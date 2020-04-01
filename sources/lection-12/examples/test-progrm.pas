program TestComplexWithUnit;

uses
	Complex,
	TestComplex;

const
	DONE = 'DONE';
	FAIL = 'FAIL';
type
	//тип функции для тестирования
	TTestFunction = function():boolean;	

//запуск тестов
function RunOne(F: TTestFunction; aShowSucc, aShowFail: boolean; aMessage: string;
	var iSuccCount, iFailCount: integer): boolean;
var
	r: boolean;
begin
	r := F();

	if r then
	begin
		inc(iSuccCount);

		if aShowSucc then writeln(aMessage + ';Result=', DONE);
	end
	else
	begin
		inc(iFailCount);

		if aShowFail then writeln(aMessage + ';Result=', FAIL);
	end

	RunOne := r;
end;

function Run(aShowSucc, aShowFail: boolean): boolean;
var
	FailCount, SuccCount: integer;
begin
	SuccCount := 0;
	FailCount := 0;

	//test Init
	RunOne(Init_t01, aShowSucc, aShowFail, SuccCount, FailCount);
	
	//test Add
	RunOne(Add_t01, aShowSucc, aShowFail, SuccCount, FailCount);

	//test Sub
	RunOne(Sub_t01, aShowSucc, aShowFail, SuccCount, FailCount);
	
	//test Mul
	RunOne(Mul_t01, aShowSucc, aShowFail, SuccCount, FailCount);
	RunOne(Mul_t02, aShowSucc, aShowFail, SuccCount, FailCount);		
	
	//test Div
	RunOne(Mul_t01, aShowSucc, aShowFail, SuccCount, FailCount);
	RunOne(Div_t02, aShowSucc, aShowFail, SuccCount, FailCount);
	RunOne(Div_t03, aShowSucc, aShowFail, SuccCount, FailCount);
	RunOne(Div_t04, aShowSucc, aShowFail, SuccCount, FailCount);

	writeln('Runed  :', SuccCount + FailCount);
	writeln('Success:', SuccCount);
	writeln('Failed :', FailCount);
end;

begin
	if Run(true, true) then
		writeln('Test OK!')
	else
		writeln('Test Failed...');
end.
