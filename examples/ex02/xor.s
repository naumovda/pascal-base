	.file "xor.pas"
# Begin asmlist al_procedures

.section .text.n__main,"x"
	.balign 16,0x90
.globl	PASCALMAIN
PASCALMAIN:
.globl	_main
_main:
	pushl	%ebp
	movl	%esp,%ebp
	pushl	%ebx
	call	FPC_INITIALIZEUNITS
	movw	$10,U_$P$TEST_XOR_$$_X
	movw	$230,U_$P$TEST_XOR_$$_Y
	call	fpc_get_output
	movl	%eax,%ebx
	movl	$_$TEST_XOR$_Ld1,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movzwl	U_$P$TEST_XOR_$$_X,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_uint
	call	FPC_IOCHECK
	movl	%ebx,%eax
	call	fpc_writeln_end
	call	FPC_IOCHECK
	call	fpc_get_output
	movl	%eax,%ebx
	movl	$_$TEST_XOR$_Ld2,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movzwl	U_$P$TEST_XOR_$$_Y,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_uint
	call	FPC_IOCHECK
	movl	%ebx,%eax
	call	fpc_writeln_end
	call	FPC_IOCHECK
	movw	U_$P$TEST_XOR_$$_X,%dx
	movw	U_$P$TEST_XOR_$$_Y,%ax
	xorw	%dx,%ax
	movw	%ax,U_$P$TEST_XOR_$$_X
	movw	U_$P$TEST_XOR_$$_X,%dx
	movw	U_$P$TEST_XOR_$$_Y,%ax
	xorw	%dx,%ax
	movw	%ax,U_$P$TEST_XOR_$$_Y
	movw	U_$P$TEST_XOR_$$_X,%dx
	movw	U_$P$TEST_XOR_$$_Y,%ax
	xorw	%dx,%ax
	movw	%ax,U_$P$TEST_XOR_$$_X
	call	fpc_get_output
	movl	%eax,%ebx
	movl	$_$TEST_XOR$_Ld1,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movzwl	U_$P$TEST_XOR_$$_X,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_uint
	call	FPC_IOCHECK
	movl	%ebx,%eax
	call	fpc_writeln_end
	call	FPC_IOCHECK
	call	fpc_get_output
	movl	%eax,%ebx
	movl	$_$TEST_XOR$_Ld2,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_shortstr
	call	FPC_IOCHECK
	movzwl	U_$P$TEST_XOR_$$_Y,%ecx
	movl	%ebx,%edx
	movl	$0,%eax
	call	fpc_write_text_uint
	call	FPC_IOCHECK
	movl	%ebx,%eax
	call	fpc_writeln_end
	call	FPC_IOCHECK
	call	fpc_get_input
	movl	%eax,%ebx
	movl	%ebx,%eax
	call	fpc_readln_end
	call	FPC_IOCHECK
	call	FPC_DO_EXIT
	popl	%ebx
	leave
	ret
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
U_$P$TEST_XOR_$$_X:
	.zero 2

.section .bss
	.balign 2
U_$P$TEST_XOR_$$_Y:
	.zero 2

.section .data.n_INITFINAL,"d"
	.balign 4
.globl	INITFINAL
INITFINAL:
	.long	2,0
	.long	INIT$_$SYSTEM
	.long	0
	.long	INIT$_$FPINTRES
	.long	0

.section .data.n_FPC_THREADVARTABLES,"d"
	.balign 4
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	1
	.long	THREADVARLIST_$SYSTEM

.section .data.n_FPC_RESOURCESTRINGTABLES,"d"
	.balign 4
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.long	0

.section .data.n_FPC_WIDEINITTABLES,"d"
	.balign 4
.globl	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES:
	.long	0

.section .data.n_FPC_RESSTRINITTABLES,"d"
	.balign 4
.globl	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES:
	.long	0

.section .fpc.n_version
	.balign 16
	.ascii	"FPC 3.0.4 [2019/08/04] for i386 - Win32"

.section .data.n___heapsize,"d"
	.balign 4
.globl	__heapsize
__heapsize:
	.long	0

.section .data.n___fpc_valgrind,"d"
.globl	__fpc_valgrind
__fpc_valgrind:
	.byte	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__$TEST_XOR$_Ld1,"d"
	.balign 4
.globl	_$TEST_XOR$_Ld1
_$TEST_XOR$_Ld1:
	.ascii	"\004x = \000"

.section .rodata.n__$TEST_XOR$_Ld2,"d"
	.balign 4
.globl	_$TEST_XOR$_Ld2
_$TEST_XOR$_Ld2:
	.ascii	"\004y = \000"
# End asmlist al_typedconsts

