{
	Модуль тестирования библиотеки работы с комплексными числами

	version 0.2
}
unit testComplex;

interface
	uses
		Complex;

	//запуск тестов
	function Run: boolean;	

	//тестирование Init(Re, Im: TСElem; var A: TComplex); 
	function Init_t01: boolean;

	//тестирование сложения Add(const A, B: TComplex; var C: TComplex); 
	function Add_t01: boolean; 

	//тестирование Sub(const A, B: TComplex; var C: TComplex); 
	function Sub_t01: boolean; 

	//тестирование умножения Mul(const A, B: TComplex; var C: TComplex); 
	function Mul_t01: boolean; 
	function Mul_t02: boolean; 

	//тестирование деление Div(const A, B: TComplex; var C: TComplex); 
	function Div_t01: boolean;
	function Div_t02: boolean;
	function Div_t03: boolean;

	//тестирование получения сопряженного числа 
	//	Conj(const A: TComplex; var B: TComplex); 
	function Conj_t01: boolean;

	//тестирование действительной части GetRe(const A: TComplex): TCElem;
	function GetRe_t01: boolean;

	//тестирование получения мнимой части GetIm(const A: TComplex): TCElem;
	function GetIm_t01: boolean;

	//получение модуля GetModule(const A: TComplex): TCElem;
	function GetModule_t01: boolean;
	function GetModule_t02: boolean;

	//получение аргумента GetArgument(const A: TComplex): TCElem;
	function GetArgument_t01: boolean;
	function GetArgument_t02: boolean;
	function GetArgument_t03: boolean;
	function GetArgument_t04: boolean;
	function GetArgument_t05: boolean;
	function GetArgument_t06: boolean;

	//установка формы вывода по умолчанию SetDefaultForm(aForm: TCOutputForm);
	function SetDefaultForm_t01: boolean;

	//формирование представления в виде строки CToString(const A: TComplex): string;
	function CToString_t01: boolean;

	//формирование представления в виде строки в заданной форме
	//  CToStringForm(const A: TComplex; aForm: TCOutputForm): string;
	function CToStringForm_t01: boolean;

	//получение признака ошибки вычислений CGetError:integer;
	function CGetError_t01: boolean;

	//установка признака ошибки вычислений CSetError(aError: integer):integer;
	function CSetError_t01: boolean;

	//сброс признака ошибки вычислений CClearError;
	function CClearError_t01: boolean;

	//расшифровка кода ошибки GetErrorMessage:string;
	function GetErrorMessage_t01: boolean;

implementation
	
end.
	