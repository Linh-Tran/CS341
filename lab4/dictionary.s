	.file	"dictionary.c"
	.text
.Ltext0:
	.globl	h_mod
	.type	h_mod, @function
h_mod:
.LFB36:
	.file 1 "dictionary.c"
	.loc 1 119 0
	.cfi_startproc
.LVL0:
	.loc 1 122 0
	leaq	1(%rdi), %rsi
.LVL1:
	movzbl	(%rdi), %ecx
.LVL2:
	testb	%cl, %cl
	je	.L4
	.loc 1 123 0
	movl	tsize(%rip), %edi
	.loc 1 120 0
	movl	$0, %edx
.LVL3:
.L3:
	.loc 1 123 0
	movsbl	%cl, %ecx
.LVL4:
	sall	$7, %edx
.LVL5:
	leal	(%rcx,%rdx), %eax
	movl	$0, %edx
	divl	%edi
.LVL6:
	.loc 1 122 0
	addq	$1, %rsi
.LVL7:
	movzbl	-1(%rsi), %ecx
.LVL8:
	testb	%cl, %cl
	jne	.L3
	jmp	.L2
.LVL9:
.L4:
	.loc 1 120 0
	movl	$0, %edx
.LVL10:
.L2:
	.loc 1 125 0
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE36:
	.size	h_mod, .-h_mod
	.globl	h_add
	.type	h_add, @function
h_add:
.LFB37:
	.loc 1 129 0
	.cfi_startproc
.LVL11:
	.loc 1 132 0
	leaq	1(%rdi), %rsi
.LVL12:
	movzbl	(%rdi), %ecx
.LVL13:
	testb	%cl, %cl
	je	.L8
	.loc 1 130 0
	movl	$0, %eax
.LVL14:
.L7:
	.loc 1 133 0
	movsbl	%cl, %ecx
.LVL15:
	addl	%ecx, %eax
.LVL16:
	.loc 1 132 0
	addq	$1, %rsi
.LVL17:
	movzbl	-1(%rsi), %ecx
.LVL18:
	testb	%cl, %cl
	jne	.L7
	jmp	.L6
.LVL19:
.L8:
	.loc 1 130 0
	movl	$0, %eax
.LVL20:
.L6:
	.loc 1 134 0
	movl	$0, %edx
	divl	tsize(%rip)
	.loc 1 135 0
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE37:
	.size	h_add, .-h_add
	.globl	h_xor
	.type	h_xor, @function
h_xor:
.LFB38:
	.loc 1 139 0
	.cfi_startproc
.LVL21:
	.loc 1 142 0
	leaq	1(%rdi), %rcx
.LVL22:
	movzbl	(%rdi), %edx
.LVL23:
	testb	%dl, %dl
	je	.L12
	.loc 1 140 0
	movl	$0, %eax
.LVL24:
.L11:
	.loc 1 143 0
	movsbl	%dl, %edx
.LVL25:
	xorl	%eax, %edx
.LVL26:
	sall	$4, %edx
	shrl	$28, %eax
.LVL27:
	orl	%edx, %eax
.LVL28:
	.loc 1 142 0
	addq	$1, %rcx
.LVL29:
	movzbl	-1(%rcx), %edx
.LVL30:
	testb	%dl, %dl
	jne	.L11
	jmp	.L10
.LVL31:
.L12:
	.loc 1 140 0
	movl	$0, %eax
.LVL32:
.L10:
	.loc 1 144 0
	movl	$0, %edx
	divl	tsize(%rip)
	.loc 1 145 0
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE38:
	.size	h_xor, .-h_xor
	.globl	compare_ele
	.type	compare_ele, @function
compare_ele:
.LFB43:
	.loc 1 240 0
	.cfi_startproc
.LVL33:
	.loc 1 243 0
	movq	(%rsi), %rax
	movq	(%rdi), %rdx
	movl	8(%rax), %eax
	subl	8(%rdx), %eax
	.loc 1 244 0
	ret
	.cfi_endproc
.LFE43:
	.size	compare_ele, .-compare_ele
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Couldn't allocate hash array, exiting\n"
	.text
	.type	new_table, @function
new_table:
.LFB34:
	.loc 1 83 0
	.cfi_startproc
.LVL34:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 84 0
	movl	%edi, tsize(%rip)
	.loc 1 85 0
	movslq	%edi, %rdi
.LVL35:
	movl	$8, %esi
	call	calloc
.LVL36:
	movq	%rax, htable(%rip)
	.loc 1 86 0
	testq	%rax, %rax
	jne	.L14
.LVL37:
.LBB41:
.LBB42:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
.LVL38:
.LBE42:
.LBE41:
	.loc 1 88 0
	movl	$1, %edi
	call	exit
.LVL39:
.L14:
	.loc 1 90 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE34:
	.size	new_table, .-new_table
	.globl	Strlen
	.type	Strlen, @function
Strlen:
.LFB33:
	.loc 1 57 0
	.cfi_startproc
.LVL40:
	.loc 1 59 0
	movl	$0, %eax
	movq	$-1, %rcx
	repnz scasb
.LVL41:
	notq	%rcx
	leaq	-1(%rcx), %rax
	.loc 1 68 0
	ret
	.cfi_endproc
.LFE33:
	.size	Strlen, .-Strlen
	.globl	lower1
	.type	lower1, @function
lower1:
.LFB31:
	.loc 1 30 0
	.cfi_startproc
.LVL42:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
.LVL43:
	.loc 1 33 0
	movl	$0, %ebx
	jmp	.L19
.LVL44:
.L21:
	.loc 1 34 0
	addq	%r12, %rbp
	movzbl	0(%rbp), %eax
	leal	-65(%rax), %edx
	cmpb	$25, %dl
	ja	.L20
	.loc 1 35 0
	addl	$32, %eax
	movb	%al, 0(%rbp)
.L20:
	.loc 1 33 0
	addl	$1, %ebx
.LVL45:
.L19:
	.loc 1 33 0 is_stmt 0 discriminator 1
	movslq	%ebx, %rbp
	movq	%r12, %rdi
	call	Strlen
.LVL46:
	cmpq	%rax, %rbp
	jb	.L21
	.loc 1 36 0 is_stmt 1
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL47:
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL48:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL49:
	ret
	.cfi_endproc
.LFE31:
	.size	lower1, .-lower1
	.globl	lower2
	.type	lower2, @function
lower2:
.LFB32:
	.loc 1 40 0
	.cfi_startproc
.LVL50:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	.loc 1 42 0
	call	Strlen
.LVL51:
	.loc 1 44 0
	testl	%eax, %eax
	jle	.L23
	movl	%eax, %esi
	movl	$0, %eax
.LVL52:
.L26:
	.loc 1 45 0
	movzbl	(%rbx,%rax), %edx
	leal	-65(%rdx), %ecx
	cmpb	$25, %cl
	ja	.L25
	.loc 1 46 0
	addl	$32, %edx
	movb	%dl, (%rbx,%rax)
.L25:
.LVL53:
	addq	$1, %rax
.LVL54:
	.loc 1 44 0
	cmpl	%eax, %esi
	jg	.L26
.LVL55:
.L23:
	.loc 1 47 0
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL56:
	ret
	.cfi_endproc
.LFE32:
	.size	lower2, .-lower2
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"Couldn't allocate hash element, exiting\n"
	.text
	.type	new_ele, @function
new_ele:
.LFB35:
	.loc 1 93 0
	.cfi_startproc
.LVL57:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	.loc 1 94 0
	movl	$24, %edi
.LVL58:
	call	malloc
.LVL59:
	movq	%rax, %rbx
.LVL60:
	.loc 1 95 0
	movq	%rbp, %rdi
	call	Strlen
.LVL61:
	.loc 1 96 0
	movl	llen(%rip), %edx
	cmpl	%edx, %eax
	jle	.L29
	.loc 1 97 0
	movq	%rbp, lstring(%rip)
	.loc 1 98 0
	movl	%eax, llen(%rip)
	.loc 1 99 0
	movl	$1, lcnt(%rip)
	jmp	.L30
.L29:
	.loc 1 100 0
	cmpl	%edx, %eax
	jne	.L30
	.loc 1 101 0
	addl	$1, lcnt(%rip)
.L30:
	.loc 1 102 0
	testq	%rbx, %rbx
	jne	.L31
.LVL62:
.LBB43:
.LBB44:
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	call	fwrite
.LVL63:
.LBE44:
.LBE43:
	.loc 1 104 0
	movl	$1, %edi
	call	exit
.LVL64:
.L31:
	.loc 1 107 0
	movq	%rbp, (%rbx)
	.loc 1 108 0
	movl	$1, 8(%rbx)
	.loc 1 110 0
	movq	%rbx, %rax
.LVL65:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL66:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL67:
	ret
	.cfi_endproc
.LFE35:
	.size	new_ele, .-new_ele
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Couldn't allocate space for string, exiting\n"
	.text
	.globl	save_string
	.type	save_string, @function
save_string:
.LFB39:
	.loc 1 152 0
	.cfi_startproc
.LVL68:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	.loc 1 153 0
	call	Strlen
.LVL69:
	leaq	1(%rax), %rdi
	call	malloc
.LVL70:
	movq	%rax, %rbx
.LVL71:
	.loc 1 154 0
	testq	%rax, %rax
	jne	.L34
.LVL72:
.LBB45:
.LBB46:
	.loc 2 97 0
	movq	stderr(%rip), %rcx
	movl	$44, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
.LVL73:
.LBE46:
.LBE45:
	.loc 1 156 0
	movl	$1, %edi
	call	exit
.LVL74:
.L34:
.LBB47:
.LBB48:
	.file 3 "/usr/include/x86_64-linux-gnu/bits/string3.h"
	.loc 3 104 0
	movq	%rbp, %rsi
	movq	%rax, %rdi
	call	strcpy
.LVL75:
.LBE48:
.LBE47:
	.loc 1 160 0
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL76:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL77:
	ret
	.cfi_endproc
.LFE39:
	.size	save_string, .-save_string
	.globl	find_ele_rec
	.type	find_ele_rec, @function
find_ele_rec:
.LFB40:
	.loc 1 164 0
	.cfi_startproc
.LVL78:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	.loc 1 165 0
	testq	%rdi, %rdi
	jne	.L37
	.loc 1 167 0
	addl	$1, ucnt(%rip)
	.loc 1 168 0
	movq	%rsi, %rdi
.LVL79:
	call	save_string
.LVL80:
	movq	%rax, %rdi
	call	new_ele
.LVL81:
	jmp	.L38
.LVL82:
.L37:
	.loc 1 170 0
	movq	(%rdi), %rsi
.LVL83:
	movq	%rbp, %rdi
	call	strcmp
.LVL84:
	testl	%eax, %eax
	jne	.L39
	.loc 1 171 0
	movl	8(%rbx), %eax
	leal	1(%rax), %edx
	movl	%edx, 8(%rbx)
	.loc 1 176 0
	movq	%rbx, %rax
	.loc 1 172 0
	cmpl	mcnt(%rip), %edx
	jle	.L38
.LVL85:
	.loc 1 173 0
	movl	%edx, mcnt(%rip)
	.loc 1 174 0
	movq	(%rbx), %rax
.LVL86:
	movq	%rax, mstring(%rip)
	.loc 1 176 0
	movq	%rbx, %rax
	jmp	.L38
.L39:
	.loc 1 178 0
	movq	16(%rbx), %rdi
	movq	%rbp, %rsi
	call	find_ele_rec
.LVL87:
	movq	%rax, 16(%rbx)
	.loc 1 179 0
	movq	%rbx, %rax
.L38:
	.loc 1 180 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL88:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL89:
	ret
	.cfi_endproc
.LFE40:
	.size	find_ele_rec, .-find_ele_rec
	.globl	find_ele_iter_f
	.type	find_ele_iter_f, @function
find_ele_iter_f:
.LFB41:
	.loc 1 184 0
	.cfi_startproc
.LVL90:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %r13
	movq	%rsi, %r12
.LVL91:
	.loc 1 186 0
	testq	%rdi, %rdi
	je	.L43
	movq	%rdi, %rbx
.LVL92:
.L46:
.LBB49:
	.loc 1 187 0
	movq	(%rbx), %rbp
.LVL93:
	.loc 1 188 0
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strcmp
.LVL94:
	testl	%eax, %eax
	jne	.L44
.LBB50:
	.loc 1 189 0
	movl	8(%rbx), %eax
	leal	1(%rax), %edx
	movl	%edx, 8(%rbx)
.LVL95:
	.loc 1 194 0
	movq	%r13, %rax
	.loc 1 190 0
	cmpl	mcnt(%rip), %edx
	jle	.L45
.LVL96:
	.loc 1 191 0
	movl	%edx, mcnt(%rip)
	.loc 1 192 0
	movq	%rbp, mstring(%rip)
	jmp	.L45
.LVL97:
.L44:
.LBE50:
.LBE49:
	.loc 1 186 0
	movq	16(%rbx), %rbx
.LVL98:
	testq	%rbx, %rbx
	jne	.L46
.LVL99:
.L43:
	.loc 1 197 0
	movq	%r12, %rdi
	call	save_string
.LVL100:
	movq	%rax, %rdi
	call	new_ele
.LVL101:
	.loc 1 198 0
	addl	$1, ucnt(%rip)
	.loc 1 199 0
	movq	%r13, 16(%rax)
.LVL102:
.L45:
	.loc 1 201 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL103:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL104:
	ret
	.cfi_endproc
.LFE41:
	.size	find_ele_iter_f, .-find_ele_iter_f
	.globl	find_ele_iter_r
	.type	find_ele_iter_r, @function
find_ele_iter_r:
.LFB42:
	.loc 1 205 0
	.cfi_startproc
.LVL105:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, %r13
	movq	%rsi, %r12
.LVL106:
	.loc 1 208 0
	testq	%rdi, %rdi
	je	.L50
	movq	%rdi, %rbx
.LVL107:
.L54:
.LBB51:
	.loc 1 209 0
	movq	(%rbx), %rbp
.LVL108:
	.loc 1 210 0
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strcmp
.LVL109:
	testl	%eax, %eax
	jne	.L51
.LBB52:
	.loc 1 211 0
	movl	8(%rbx), %eax
	leal	1(%rax), %edx
	movl	%edx, 8(%rbx)
.LVL110:
	.loc 1 216 0
	movq	%r13, %rax
	.loc 1 212 0
	cmpl	mcnt(%rip), %edx
	jle	.L57
.LVL111:
	.loc 1 213 0
	movl	%edx, mcnt(%rip)
	.loc 1 214 0
	movq	%rbp, mstring(%rip)
	jmp	.L57
.LVL112:
.L51:
.LBE52:
.LBE51:
	.loc 1 208 0
	movq	16(%rbx), %rax
.LVL113:
	testq	%rax, %rax
	je	.L53
	movq	%rax, %rbx
.LVL114:
	jmp	.L54
.LVL115:
.L53:
	.loc 1 220 0
	movq	%r12, %rdi
	call	save_string
.LVL116:
	movq	%rax, %rdi
	call	new_ele
.LVL117:
	.loc 1 221 0
	addl	$1, ucnt(%rip)
	.loc 1 222 0
	movq	$0, 16(%rax)
	.loc 1 223 0
	testq	%rbx, %rbx
	je	.L57
	.loc 1 224 0
	movq	%rax, 16(%rbx)
	.loc 1 225 0
	movq	%r13, %rax
.LVL118:
	jmp	.L57
.LVL119:
.L50:
	.loc 1 220 0
	movq	%rsi, %rdi
.LVL120:
	call	save_string
.LVL121:
	movq	%rax, %rdi
	call	new_ele
.LVL122:
	.loc 1 221 0
	addl	$1, ucnt(%rip)
	.loc 1 222 0
	movq	$0, 16(%rax)
.LVL123:
.L57:
	.loc 1 228 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL124:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL125:
	ret
	.cfi_endproc
.LFE42:
	.size	find_ele_iter_r, .-find_ele_iter_r
	.globl	sort_words
	.type	sort_words, @function
sort_words:
.LFB44:
	.loc 1 249 0
	.cfi_startproc
.LVL126:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %r12d
.LVL127:
	.loc 1 252 0
	movslq	ucnt(%rip), %rdi
.LVL128:
	movl	$8, %esi
	call	calloc
.LVL129:
	movq	%rax, %rbx
.LVL130:
	.loc 1 255 0
	movl	$0, scnt(%rip)
.LVL131:
	.loc 1 256 0
	movl	tsize(%rip), %r10d
	testl	%r10d, %r10d
	jle	.L74
	.loc 1 257 0
	movq	htable(%rip), %r11
	movl	$0, %r9d
	.loc 1 254 0
	movl	$0, %ebp
.LVL132:
.L70:
	.loc 1 257 0
	movq	(%r11,%r9,8), %rax
.LVL133:
	testq	%rax, %rax
	je	.L61
	movl	scnt(%rip), %r8d
.L69:
	.loc 1 258 0
	movl	8(%rax), %edi
	cmpl	$1, %edi
	.loc 1 259 0
	sete	%dl
	movzbl	%dl, %edx
	addl	%edx, %r8d
	.loc 1 260 0
	testl	%r12d, %r12d
	jne	.L63
.LVL134:
	.loc 1 263 0 discriminator 1
	testl	%ebp, %ebp
	jle	.L75
	.loc 1 263 0 is_stmt 0
	movslq	%ebp, %rsi
	salq	$3, %rsi
	movq	-8(%rbx,%rsi), %rcx
	movl	%ebp, %edx
	cmpl	8(%rcx), %edi
	jg	.L76
	jmp	.L64
.LVL135:
.L63:
	.loc 1 261 0 is_stmt 1
	movslq	%ebp, %rdx
	movq	%rax, (%rbx,%rdx,8)
	jmp	.L66
.LVL136:
.L76:
	.loc 1 264 0 discriminator 1
	movq	%rcx, (%rbx,%rsi)
.LVL137:
	.loc 1 263 0 discriminator 1
	subl	$1, %edx
.LVL138:
	je	.L64
	.loc 1 263 0 is_stmt 0 discriminator 2
	movslq	%edx, %rsi
	salq	$3, %rsi
	movq	-8(%rbx,%rsi), %rcx
	movl	8(%rcx), %edi
	cmpl	%edi, 8(%rax)
	jg	.L76
	jmp	.L64
.LVL139:
.L75:
	.loc 1 263 0
	movl	%ebp, %edx
.LVL140:
.L64:
	.loc 1 265 0 is_stmt 1
	movslq	%edx, %rdx
	movq	%rax, (%rbx,%rdx,8)
.LVL141:
.L66:
	.loc 1 267 0
	addl	$1, %ebp
.LVL142:
	.loc 1 257 0
	movq	16(%rax), %rax
.LVL143:
	testq	%rax, %rax
	jne	.L69
	movl	%r8d, scnt(%rip)
.L61:
.LVL144:
	addq	$1, %r9
.LVL145:
	.loc 1 256 0
	cmpl	%r9d, %r10d
	jg	.L70
	jmp	.L60
.LVL146:
.L74:
	.loc 1 254 0
	movl	$0, %ebp
.LVL147:
.L60:
	.loc 1 269 0
	testl	%r12d, %r12d
	je	.L71
	.loc 1 270 0
	movslq	%ebp, %rsi
	movl	$compare_ele, %ecx
	movl	$8, %edx
	movq	%rbx, %rdi
	call	qsort
.LVL148:
.L71:
	.loc 1 272 0
	movq	(%rbx), %r12
.LVL149:
	.loc 1 273 0
	leal	-1(%rbp), %eax
	testl	%eax, %eax
	jle	.L72
	movl	$0, %edx
.LVL150:
.L73:
	.loc 1 274 0 discriminator 2
	movq	(%rbx,%rdx,8), %rcx
	movq	8(%rbx,%rdx,8), %rsi
	movq	%rsi, 16(%rcx)
.LVL151:
	addq	$1, %rdx
.LVL152:
	.loc 1 273 0 discriminator 2
	cmpl	%edx, %eax
	jg	.L73
.L72:
	.loc 1 275 0
	movslq	%ebp, %rbp
	movq	-8(%rbx,%rbp,8), %rax
	movq	$0, 16(%rax)
	.loc 1 276 0
	movq	%rbx, %rdi
	call	free
.LVL153:
	.loc 1 278 0
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL154:
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL155:
	ret
	.cfi_endproc
.LFE44:
	.size	sort_words, .-sort_words
	.globl	insert_string
	.type	insert_string, @function
insert_string:
.LFB45:
	.loc 1 284 0
	.cfi_startproc
.LVL156:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rcx, %r12
	.loc 1 286 0
	call	*%rdx
.LVL157:
	.loc 1 287 0
	movq	%rbx, %rdi
	call	*%rbp
.LVL158:
	.loc 1 288 0
	cltq
	movq	htable(%rip), %rdx
	leaq	(%rdx,%rax,8), %rbp
.LVL159:
	movq	%rbx, %rsi
	movq	0(%rbp), %rdi
	call	*%r12
.LVL160:
	movq	%rax, 0(%rbp)
	.loc 1 289 0
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL161:
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL162:
	ret
	.cfi_endproc
.LFE45:
	.size	insert_string, .-insert_string
	.globl	init_token
	.type	init_token, @function
init_token:
.LFB46:
	.loc 1 297 0
	.cfi_startproc
.LVL163:
	.loc 1 298 0
	movl	$0, bufvalid(%rip)
	.loc 1 299 0
	movq	%rdi, infile(%rip)
	ret
	.cfi_endproc
.LFE46:
	.size	init_token, .-init_token
	.section	.rodata
	.align 8
.LC3:
	.string	" \t\n\r.,:;/<>()[]{}?!\"-'"
	.string	"xc2"
	.string	"xa0"
	.text
	.globl	get_word
	.type	get_word, @function
get_word:
.LFB47:
	.loc 1 307 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
.L85:
	.loc 1 310 0
	cmpl	$0, bufvalid(%rip)
	je	.L82
	.loc 1 311 0
	movl	$.LC3, %esi
	movl	$0, %edi
	call	strtok
.LVL164:
	.loc 1 312 0
	testq	%rax, %rax
	jne	.L83
.LVL165:
.L82:
.LBB53:
.LBB54:
	.loc 2 263 0
	movq	infile(%rip), %rdx
	movl	$1024, %esi
	movl	$buf, %edi
	call	fgets
.LVL166:
.LBE54:
.LBE53:
	.loc 1 315 0
	testq	%rax, %rax
	je	.L84
	.loc 1 317 0
	movl	$1, bufvalid(%rip)
	.loc 1 318 0
	movl	$.LC3, %esi
	movl	$buf, %edi
	call	strtok
.LVL167:
	.loc 1 319 0
	testq	%rax, %rax
	je	.L85
.LVL168:
.L83:
	.loc 1 322 0
	addl	$1, wcnt(%rip)
.LVL169:
.L84:
	.loc 1 324 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE47:
	.size	get_word, .-get_word
	.globl	get_token
	.type	get_token, @function
get_token:
.LFB48:
	.loc 1 330 0
	.cfi_startproc
.LVL170:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, %r13d
.LVL171:
	.loc 1 339 0
	cmpl	$1, %edi
	jne	.L88
	.loc 1 340 0
	movl	$0, %eax
	call	get_word
.LVL172:
	jmp	.L89
.LVL173:
.L88:
	.loc 1 341 0
	cmpl	$0, first.3578(%rip)
	je	.L90
	.loc 1 343 0 discriminator 1
	leal	-1(%rdi), %ebx
	cmpl	bindex.3579(%rip), %ebx
	jle	.L91
.LVL174:
.L92:
.LBB55:
	.loc 1 344 0
	movl	$0, %eax
	call	get_word
.LVL175:
	.loc 1 345 0
	testq	%rax, %rax
	je	.L99
	.loc 1 348 0
	movl	bindex.3579(%rip), %edx
	leal	1(%rdx), %ecx
	movl	%ecx, bindex.3579(%rip)
.LVL176:
.LBB56:
.LBB57:
	.loc 3 104 0
	movslq	%edx, %rdi
	salq	$10, %rdi
	addq	$token_buf.3577, %rdi
.LVL177:
	movq	%rax, %rsi
	call	strcpy
.LVL178:
.LBE57:
.LBE56:
.LBE55:
	.loc 1 343 0
	cmpl	%ebx, bindex.3579(%rip)
	jl	.L92
.L91:
	.loc 1 350 0
	movl	$0, first.3578(%rip)
.L90:
	.loc 1 353 0
	movl	$0, %eax
	call	get_word
.LVL179:
	.loc 1 354 0
	testq	%rax, %rax
	je	.L100
	.loc 1 357 0
	movl	bindex.3579(%rip), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, bindex.3579(%rip)
.LVL180:
.LBB58:
.LBB59:
	.loc 3 104 0
	movslq	%edx, %rdi
	salq	$10, %rdi
	addq	$token_buf.3577, %rdi
.LVL181:
	movq	%rax, %rsi
	call	strcpy
.LVL182:
.LBE59:
.LBE58:
	.loc 1 358 0
	cmpl	$9, %ebx
	jle	.L93
	.loc 1 359 0
	movl	$0, bindex.3579(%rip)
.L93:
.LVL183:
	.loc 1 362 0
	movl	bindex.3579(%rip), %ebx
.LVL184:
	subl	%r13d, %ebx
.LVL185:
	.loc 1 363 0
	leal	10(%rbx), %eax
	testl	%ebx, %ebx
	cmovs	%eax, %ebx
.LVL186:
	.loc 1 364 0
	testl	%r13d, %r13d
	jle	.L101
	movl	$0, %ebp
	movl	$sbuf.3580, %r12d
	.loc 1 372 0
	movl	$0, %r14d
	jmp	.L95
.LVL187:
.L98:
	.loc 1 365 0
	testl	%ebp, %ebp
	je	.L102
	.loc 1 366 0
	leaq	1(%rax), %r12
.LVL188:
	movb	$32, (%rax)
	jmp	.L95
.LVL189:
.L102:
	.loc 1 369 0
	movq	%rax, %r12
.LVL190:
.L95:
	.loc 1 367 0
	movslq	%ebx, %r15
	salq	$10, %r15
	addq	$token_buf.3577, %r15
.LVL191:
.LBB60:
.LBB61:
	.loc 3 104 0
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	strcpy
.LVL192:
.LBE61:
.LBE60:
	.loc 1 369 0
	movq	%r15, %rdi
	call	Strlen
.LVL193:
	addq	%r12, %rax
.LVL194:
	.loc 1 370 0
	addl	$1, %ebx
.LVL195:
	.loc 1 372 0
	cmpl	$10, %ebx
	cmovge	%r14d, %ebx
.LVL196:
	.loc 1 364 0
	addl	$1, %ebp
.LVL197:
	cmpl	%r13d, %ebp
	jne	.L98
	.loc 1 377 0
	movl	$sbuf.3580, %eax
.LVL198:
	jmp	.L89
.LVL199:
.L99:
.LBB62:
	.loc 1 346 0
	movl	$0, %eax
.LVL200:
	jmp	.L89
.LVL201:
.L100:
.LBE62:
	.loc 1 355 0
	movl	$0, %eax
.LVL202:
	jmp	.L89
.LVL203:
.L101:
	.loc 1 377 0
	movl	$sbuf.3580, %eax
.LVL204:
.L89:
	.loc 1 378 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL205:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE48:
	.size	get_token, .-get_token
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"%d\t'%s'\n"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"%d n-grams, %d unique, %d singletons.  Most common (%d) = '%s'.  Longest (%d have length %d) = '%s'\n"
	.text
	.globl	word_freq
	.type	word_freq, @function
word_freq:
.LFB49:
	.loc 1 386 0
	.cfi_startproc
.LVL206:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%esi, %r14d
	movl	%edx, %ebx
	movl	%ecx, %r15d
	movl	%r8d, 44(%rsp)
	movq	%r9, %r13
	movq	112(%rsp), %r12
	movq	120(%rsp), %rbp
	.loc 1 390 0
	call	init_token
.LVL207:
	.loc 1 391 0
	movl	%r15d, %edi
	call	new_table
.LVL208:
	.loc 1 393 0
	jmp	.L106
.LVL209:
.L107:
	.loc 1 394 0
	movq	%rbp, %rcx
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rax, %rdi
	call	insert_string
.LVL210:
.L106:
	.loc 1 393 0 discriminator 1
	movl	%ebx, %edi
	call	get_token
.LVL211:
	testq	%rax, %rax
	jne	.L107
	.loc 1 396 0
	testl	%r14d, %r14d
	jle	.L108
	.loc 1 397 0
	movl	44(%rsp), %edi
	call	sort_words
.LVL212:
	movq	%rax, %rbx
.LVL213:
	.loc 1 398 0
	testq	%rax, %rax
	je	.L108
	subl	$1, %r14d
.LVL214:
.L109:
.LBB63:
.LBB64:
	.loc 2 104 0
	movl	8(%rbx), %edx
	movq	(%rbx), %rcx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.LVL215:
.LBE64:
.LBE63:
	.loc 1 400 0
	movq	16(%rbx), %rbx
.LVL216:
	.loc 1 398 0
	testq	%rbx, %rbx
	je	.L108
	.loc 1 398 0 is_stmt 0 discriminator 2
	subl	$1, %r14d
.LVL217:
	cmpl	$-1, %r14d
	jne	.L109
.LVL218:
.L108:
.LBB65:
.LBB66:
	.loc 2 104 0 is_stmt 1
	movq	lstring(%rip), %rax
	movq	%rax, 24(%rsp)
	movl	llen(%rip), %eax
	movl	%eax, 16(%rsp)
	movl	lcnt(%rip), %eax
	movl	%eax, 8(%rsp)
	movq	mstring(%rip), %rax
	movq	%rax, (%rsp)
	movl	mcnt(%rip), %r9d
	movl	scnt(%rip), %r8d
	movl	ucnt(%rip), %ecx
	movl	wcnt(%rip), %edx
	movl	$.LC5, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.LVL219:
.LBE66:
.LBE65:
	.loc 1 405 0
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL220:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL221:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL222:
	ret
	.cfi_endproc
.LFE49:
	.size	word_freq, .-word_freq
	.section	.rodata.str1.1
.LC6:
	.string	"verbose"
.LC7:
	.string	"size"
.LC8:
	.string	"hash"
.LC9:
	.string	"lower"
.LC10:
	.string	"find"
.LC11:
	.string	"ngram"
.LC12:
	.string	"quicksort"
.LC13:
	.string	"file"
.LC14:
	.string	"N-gram size %d\n"
.LC15:
	.string	"Lower case function %s\n"
.LC16:
	.string	"Hash function %s\n"
.LC17:
	.string	"Find element function %s\n"
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"Invalid hash function index %d\n"
	.align 8
.LC19:
	.string	"Invalid lower function index %d\n"
	.align 8
.LC20:
	.string	"Invalid find function index %d\n"
	.section	.rodata.str1.1
.LC21:
	.string	"r"
.LC22:
	.string	"Couldn't open file '%s'\n"
.LC24:
	.string	"Total time = %f seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB50:
	.loc 1 408 0
	.cfi_startproc
.LVL223:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, %ebp
	movq	%rsi, %r12
	.loc 1 409 0
	movl	$1, 28(%rsp)
	.loc 1 410 0
	movl	$1024, 32(%rsp)
	.loc 1 411 0
	movl	$0, 36(%rsp)
	.loc 1 412 0
	movl	$0, 40(%rsp)
	.loc 1 413 0
	movl	$0, 44(%rsp)
	.loc 1 414 0
	movl	$1, 48(%rsp)
	.loc 1 415 0
	movl	$0, 52(%rsp)
	.loc 1 416 0
	movq	$0, 56(%rsp)
	.loc 1 417 0
	movq	stdin(%rip), %rbx
.LVL224:
	.loc 1 418 0
	leaq	28(%rsp), %rsi
.LVL225:
	movl	$.LC6, %edi
.LVL226:
	call	add_int_option
.LVL227:
	.loc 1 419 0
	leaq	32(%rsp), %rsi
	movl	$.LC7, %edi
	call	add_int_option
.LVL228:
	.loc 1 420 0
	leaq	36(%rsp), %rsi
	movl	$.LC8, %edi
	call	add_int_option
.LVL229:
	.loc 1 421 0
	leaq	40(%rsp), %rsi
	movl	$.LC9, %edi
	call	add_int_option
.LVL230:
	.loc 1 422 0
	leaq	44(%rsp), %rsi
	movl	$.LC10, %edi
	call	add_int_option
.LVL231:
	.loc 1 423 0
	leaq	48(%rsp), %rsi
	movl	$.LC11, %edi
	call	add_int_option
.LVL232:
	.loc 1 424 0
	leaq	52(%rsp), %rsi
	movl	$.LC12, %edi
	call	add_int_option
.LVL233:
	.loc 1 425 0
	leaq	56(%rsp), %rsi
	movl	$.LC13, %edi
	call	add_string_option
.LVL234:
	.loc 1 426 0
	movl	$0, %edx
	movq	%r12, %rsi
	movl	%ebp, %edi
	call	parse_options
.LVL235:
	.loc 1 427 0
	movq	stdout(%rip), %rdi
	call	show_options
.LVL236:
.LBB67:
.LBB68:
	.loc 2 104 0
	movl	48(%rsp), %edx
	movl	$.LC14, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.LVL237:
.LBE68:
.LBE67:
	.loc 1 429 0
	movslq	40(%rsp), %rax
.LBB69:
.LBB70:
	.loc 2 104 0
	movq	lower_fun_names(,%rax,8), %rdx
	movl	$.LC15, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.LVL238:
.LBE70:
.LBE69:
	.loc 1 430 0
	movslq	36(%rsp), %rax
.LBB71:
.LBB72:
	.loc 2 104 0
	movq	hash_fun_names(,%rax,8), %rdx
	movl	$.LC16, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.LVL239:
.LBE72:
.LBE71:
	.loc 1 431 0
	movslq	44(%rsp), %rax
.LBB73:
.LBB74:
	.loc 2 104 0
	movq	find_ele_fun_names(,%rax,8), %rdx
	movl	$.LC17, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.LVL240:
.LBE74:
.LBE73:
	.loc 1 432 0
	movl	36(%rsp), %ecx
	cmpl	$2, %ecx
	jbe	.L112
.LVL241:
.LBB75:
.LBB76:
	.loc 2 97 0
	movl	$.LC18, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk
.LVL242:
.LBE76:
.LBE75:
	.loc 1 434 0
	movl	$1, %edi
	call	exit
.LVL243:
.L112:
	.loc 1 436 0
	movl	40(%rsp), %ecx
	cmpl	$1, %ecx
	jbe	.L113
.LVL244:
.LBB77:
.LBB78:
	.loc 2 97 0
	movl	$.LC19, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk
.LVL245:
.LBE78:
.LBE77:
	.loc 1 438 0
	movl	$1, %edi
	call	exit
.LVL246:
.L113:
	.loc 1 440 0
	movl	44(%rsp), %ecx
	cmpl	$2, %ecx
	jbe	.L114
.LVL247:
.LBB79:
.LBB80:
	.loc 2 97 0
	movl	$.LC20, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk
.LVL248:
.LBE80:
.LBE79:
	.loc 1 442 0
	movl	$1, %edi
	call	exit
.LVL249:
.L114:
	.loc 1 444 0
	movq	56(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L115
	.loc 1 445 0
	movl	$.LC21, %esi
	call	fopen
.LVL250:
	movq	%rax, %rbx
.LVL251:
	.loc 1 446 0
	testq	%rax, %rax
	jne	.L115
.LVL252:
.LBB81:
.LBB82:
	.loc 2 97 0
	movq	56(%rsp), %rcx
	movl	$.LC22, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
.LVL253:
	call	__fprintf_chk
.LVL254:
.LBE82:
.LBE81:
	.loc 1 448 0
	movl	$1, %edi
	call	exit
.LVL255:
.L115:
	.loc 1 451 0
	movslq	36(%rsp), %rax
	movq	hash_fun_set(,%rax,8), %r9
	movslq	44(%rsp), %rax
	movq	find_ele_fun_set(,%rax,8), %rax
	movq	%rax, 8(%rsp)
	movslq	40(%rsp), %rax
	movq	lower_fun_set(,%rax,8), %rax
	movq	%rax, (%rsp)
	movl	52(%rsp), %r8d
	movl	32(%rsp), %ecx
	movl	48(%rsp), %edx
	movl	28(%rsp), %esi
	movq	%rbx, %rdi
	call	word_freq
.LVL256:
	.loc 1 455 0
	call	clock
.LVL257:
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC23(%rip), %xmm0
.LBB83:
.LBB84:
	.loc 2 104 0
	movl	$.LC24, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
.LVL258:
.LBE84:
.LBE83:
	.loc 1 456 0
	movq	%rbx, %rdi
	call	fclose
.LVL259:
	.loc 1 458 0
	movl	$0, %eax
	addq	$64, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL260:
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL261:
	popq	%r12
	.cfi_def_cfa_offset 8
.LVL262:
	ret
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.local	token_buf.3577
	.comm	token_buf.3577,10240,32
	.local	bindex.3579
	.comm	bindex.3579,4,4
	.data
	.align 4
	.type	first.3578, @object
	.size	first.3578, 4
first.3578:
	.long	1
	.local	sbuf.3580
	.comm	sbuf.3580,1024,32
	.comm	infile,8,8
	.globl	bufvalid
	.bss
	.align 4
	.type	bufvalid, @object
	.size	bufvalid, 4
bufvalid:
	.zero	4
	.comm	buf,1024,32
	.globl	find_ele_fun_names
	.section	.rodata.str1.1
.LC25:
	.string	"find_ele_rec"
.LC26:
	.string	"find_ele_iter_f"
.LC27:
	.string	"find_ele_iter_r"
	.data
	.align 16
	.type	find_ele_fun_names, @object
	.size	find_ele_fun_names, 24
find_ele_fun_names:
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.globl	find_ele_fun_set
	.align 16
	.type	find_ele_fun_set, @object
	.size	find_ele_fun_set, 24
find_ele_fun_set:
	.quad	find_ele_rec
	.quad	find_ele_iter_f
	.quad	find_ele_iter_r
	.globl	hash_fun_names
	.section	.rodata.str1.1
.LC28:
	.string	"h_mod"
.LC29:
	.string	"h_add"
.LC30:
	.string	"h_xor"
	.data
	.align 16
	.type	hash_fun_names, @object
	.size	hash_fun_names, 24
hash_fun_names:
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.globl	hash_fun_set
	.align 16
	.type	hash_fun_set, @object
	.size	hash_fun_set, 24
hash_fun_set:
	.quad	h_mod
	.quad	h_add
	.quad	h_xor
	.comm	tsize,4,4
	.comm	htable,8,8
	.globl	lower_fun_names
	.section	.rodata.str1.1
.LC31:
	.string	"lower1"
.LC32:
	.string	"lower2"
	.data
	.align 16
	.type	lower_fun_names, @object
	.size	lower_fun_names, 16
lower_fun_names:
	.quad	.LC31
	.quad	.LC32
	.globl	lower_fun_set
	.align 16
	.type	lower_fun_set, @object
	.size	lower_fun_set, 16
lower_fun_set:
	.quad	lower1
	.quad	lower2
	.globl	lcnt
	.bss
	.align 4
	.type	lcnt, @object
	.size	lcnt, 4
lcnt:
	.zero	4
	.globl	lstring
	.section	.rodata.str1.1
.LC33:
	.string	""
	.data
	.align 8
	.type	lstring, @object
	.size	lstring, 8
lstring:
	.quad	.LC33
	.globl	llen
	.bss
	.align 4
	.type	llen, @object
	.size	llen, 4
llen:
	.zero	4
	.globl	mstring
	.data
	.align 8
	.type	mstring, @object
	.size	mstring, 8
mstring:
	.quad	.LC33
	.globl	scnt
	.bss
	.align 4
	.type	scnt, @object
	.size	scnt, 4
scnt:
	.zero	4
	.globl	mcnt
	.align 4
	.type	mcnt, @object
	.size	mcnt, 4
mcnt:
	.zero	4
	.globl	ucnt
	.align 4
	.type	ucnt, @object
	.size	ucnt, 4
ucnt:
	.zero	4
	.globl	wcnt
	.align 4
	.type	wcnt, @object
	.size	wcnt, 4
wcnt:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	0
	.long	1093567616
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/libio.h"
	.file 8 "/usr/include/time.h"
	.file 9 "/usr/include/stdlib.h"
	.file 10 "<built-in>"
	.file 11 "/usr/include/string.h"
	.file 12 "options.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1b65
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF153
	.byte	0x1
	.long	.LASF154
	.long	.LASF155
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x5
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x5
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x5
	.byte	0x87
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xa0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x2
	.long	.LASF13
	.byte	0x6
	.byte	0x30
	.long	0xb2
	.uleb128 0x7
	.long	.LASF43
	.byte	0xd8
	.byte	0x7
	.byte	0xf5
	.long	0x232
	.uleb128 0x8
	.long	.LASF14
	.byte	0x7
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x7
	.byte	0xfb
	.long	0x9a
	.byte	0x8
	.uleb128 0x8
	.long	.LASF16
	.byte	0x7
	.byte	0xfc
	.long	0x9a
	.byte	0x10
	.uleb128 0x8
	.long	.LASF17
	.byte	0x7
	.byte	0xfd
	.long	0x9a
	.byte	0x18
	.uleb128 0x8
	.long	.LASF18
	.byte	0x7
	.byte	0xfe
	.long	0x9a
	.byte	0x20
	.uleb128 0x8
	.long	.LASF19
	.byte	0x7
	.byte	0xff
	.long	0x9a
	.byte	0x28
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.value	0x100
	.long	0x9a
	.byte	0x30
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.value	0x101
	.long	0x9a
	.byte	0x38
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.value	0x102
	.long	0x9a
	.byte	0x40
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.value	0x104
	.long	0x9a
	.byte	0x48
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.value	0x105
	.long	0x9a
	.byte	0x50
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.value	0x106
	.long	0x9a
	.byte	0x58
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.value	0x108
	.long	0x26a
	.byte	0x60
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.value	0x10a
	.long	0x270
	.byte	0x68
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF29
	.byte	0x7
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF30
	.byte	0x7
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF31
	.byte	0x7
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF32
	.byte	0x7
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF33
	.byte	0x7
	.value	0x118
	.long	0x276
	.byte	0x83
	.uleb128 0x9
	.long	.LASF34
	.byte	0x7
	.value	0x11c
	.long	0x286
	.byte	0x88
	.uleb128 0x9
	.long	.LASF35
	.byte	0x7
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF36
	.byte	0x7
	.value	0x12e
	.long	0x98
	.byte	0x98
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.value	0x12f
	.long	0x98
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x7
	.value	0x130
	.long	0x98
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.value	0x131
	.long	0x98
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x7
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF41
	.byte	0x7
	.value	0x134
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF42
	.byte	0x7
	.value	0x136
	.long	0x28c
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF156
	.byte	0x7
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF44
	.byte	0x18
	.byte	0x7
	.byte	0xa0
	.long	0x26a
	.uleb128 0x8
	.long	.LASF45
	.byte	0x7
	.byte	0xa1
	.long	0x26a
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0x7
	.byte	0xa2
	.long	0x270
	.byte	0x8
	.uleb128 0x8
	.long	.LASF47
	.byte	0x7
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x239
	.uleb128 0x6
	.byte	0x8
	.long	0xb2
	.uleb128 0xb
	.long	0xa0
	.long	0x286
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x232
	.uleb128 0xb
	.long	0xa0
	.long	0x29c
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2a2
	.uleb128 0xd
	.long	0xa0
	.uleb128 0x6
	.byte	0x8
	.long	0x62
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF48
	.uleb128 0x2
	.long	.LASF49
	.byte	0x8
	.byte	0x3b
	.long	0x8d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0xe
	.long	.LASF51
	.byte	0x9
	.value	0x2e6
	.long	0x2d2
	.uleb128 0x6
	.byte	0x8
	.long	0x2d8
	.uleb128 0xf
	.long	0x62
	.long	0x2ec
	.uleb128 0x10
	.long	0x2ec
	.uleb128 0x10
	.long	0x2ec
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2f2
	.uleb128 0x11
	.uleb128 0x2
	.long	.LASF52
	.byte	0x1
	.byte	0x18
	.long	0x2fe
	.uleb128 0x6
	.byte	0x8
	.long	0x304
	.uleb128 0x12
	.long	0x30f
	.uleb128 0x10
	.long	0x9a
	.byte	0
	.uleb128 0x7
	.long	.LASF53
	.byte	0x18
	.byte	0x1
	.byte	0x48
	.long	0x340
	.uleb128 0x8
	.long	.LASF54
	.byte	0x1
	.byte	0x49
	.long	0x9a
	.byte	0
	.uleb128 0x8
	.long	.LASF55
	.byte	0x1
	.byte	0x4a
	.long	0x62
	.byte	0x8
	.uleb128 0x8
	.long	.LASF56
	.byte	0x1
	.byte	0x4b
	.long	0x340
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x30f
	.uleb128 0x2
	.long	.LASF57
	.byte	0x1
	.byte	0x4c
	.long	0x340
	.uleb128 0x2
	.long	.LASF58
	.byte	0x1
	.byte	0x74
	.long	0x35c
	.uleb128 0x6
	.byte	0x8
	.long	0x362
	.uleb128 0xf
	.long	0x4d
	.long	0x371
	.uleb128 0x10
	.long	0x9a
	.byte	0
	.uleb128 0x2
	.long	.LASF59
	.byte	0x1
	.byte	0xe7
	.long	0x37c
	.uleb128 0x6
	.byte	0x8
	.long	0x382
	.uleb128 0xf
	.long	0x346
	.long	0x396
	.uleb128 0x10
	.long	0x346
	.uleb128 0x10
	.long	0x9a
	.byte	0
	.uleb128 0x13
	.long	.LASF62
	.byte	0x2
	.byte	0x5f
	.long	0x62
	.byte	0x3
	.long	0x3be
	.uleb128 0x14
	.long	.LASF60
	.byte	0x2
	.byte	0x5f
	.long	0x3be
	.uleb128 0x14
	.long	.LASF61
	.byte	0x2
	.byte	0x5f
	.long	0x29c
	.uleb128 0x15
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0x13
	.long	.LASF63
	.byte	0x3
	.byte	0x66
	.long	0x9a
	.byte	0x3
	.long	0x3eb
	.uleb128 0x14
	.long	.LASF64
	.byte	0x3
	.byte	0x66
	.long	0x9a
	.uleb128 0x14
	.long	.LASF65
	.byte	0x3
	.byte	0x66
	.long	0x29c
	.byte	0
	.uleb128 0x13
	.long	.LASF66
	.byte	0x2
	.byte	0xfd
	.long	0x9a
	.byte	0x3
	.long	0x41d
	.uleb128 0x16
	.string	"__s"
	.byte	0x2
	.byte	0xfd
	.long	0x9a
	.uleb128 0x16
	.string	"__n"
	.byte	0x2
	.byte	0xfd
	.long	0x62
	.uleb128 0x14
	.long	.LASF60
	.byte	0x2
	.byte	0xfd
	.long	0x3be
	.byte	0
	.uleb128 0x13
	.long	.LASF67
	.byte	0x2
	.byte	0x66
	.long	0x62
	.byte	0x3
	.long	0x43a
	.uleb128 0x14
	.long	.LASF61
	.byte	0x2
	.byte	0x66
	.long	0x29c
	.uleb128 0x15
	.byte	0
	.uleb128 0x17
	.long	.LASF68
	.byte	0x1
	.byte	0x76
	.long	0x4d
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x485
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x76
	.long	0x9a
	.long	.LLST0
	.uleb128 0x19
	.string	"val"
	.byte	0x1
	.byte	0x78
	.long	0x4d
	.long	.LLST1
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x79
	.long	0x62
	.long	.LLST2
	.byte	0
	.uleb128 0x17
	.long	.LASF69
	.byte	0x1
	.byte	0x80
	.long	0x4d
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x4d0
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x80
	.long	0x9a
	.long	.LLST3
	.uleb128 0x19
	.string	"val"
	.byte	0x1
	.byte	0x82
	.long	0x4d
	.long	.LLST4
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x83
	.long	0x62
	.long	.LLST5
	.byte	0
	.uleb128 0x17
	.long	.LASF70
	.byte	0x1
	.byte	0x8a
	.long	0x4d
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x51b
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x8a
	.long	0x9a
	.long	.LLST6
	.uleb128 0x19
	.string	"val"
	.byte	0x1
	.byte	0x8c
	.long	0x4d
	.long	.LLST7
	.uleb128 0x19
	.string	"c"
	.byte	0x1
	.byte	0x8d
	.long	0x62
	.long	.LLST8
	.byte	0
	.uleb128 0x17
	.long	.LASF71
	.byte	0x1
	.byte	0xf0
	.long	0x62
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0x573
	.uleb128 0x1a
	.long	.LASF72
	.byte	0x1
	.byte	0xf0
	.long	0x2ec
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1a
	.long	.LASF73
	.byte	0x1
	.byte	0xf0
	.long	0x2ec
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1b
	.long	.LASF74
	.byte	0x1
	.byte	0xf1
	.long	0x346
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x1b
	.long	.LASF75
	.byte	0x1
	.byte	0xf2
	.long	0x346
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.long	.LASF157
	.byte	0x1
	.byte	0x52
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0x627
	.uleb128 0x1d
	.long	.LASF76
	.byte	0x1
	.byte	0x52
	.long	0x62
	.long	.LLST9
	.uleb128 0x1e
	.long	0x396
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.byte	0x1
	.byte	0x57
	.long	0x5ef
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST10
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL38
	.long	0x1986
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL36
	.long	0x19ae
	.long	0x613
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x21
	.quad	.LVL39
	.long	0x19c9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF77
	.byte	0x1
	.byte	0x38
	.long	0x2d
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x656
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x38
	.long	0x29c
	.long	.LLST11
	.byte	0
	.uleb128 0x24
	.long	.LASF78
	.byte	0x1
	.byte	0x1d
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x6a2
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x1d
	.long	0x9a
	.long	.LLST12
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x1f
	.long	0x62
	.long	.LLST13
	.uleb128 0x21
	.quad	.LVL46
	.long	0x627
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF79
	.byte	0x1
	.byte	0x27
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x6fd
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x27
	.long	0x9a
	.long	.LLST14
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x29
	.long	0x62
	.long	.LLST15
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0x2a
	.long	0x62
	.long	.LLST16
	.uleb128 0x21
	.quad	.LVL51
	.long	0x627
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	.LASF158
	.byte	0x1
	.byte	0x5c
	.long	0x346
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0x7dc
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x5c
	.long	0x9a
	.long	.LLST17
	.uleb128 0x26
	.long	.LASF80
	.byte	0x1
	.byte	0x5e
	.long	0x346
	.long	.LLST18
	.uleb128 0x26
	.long	.LASF81
	.byte	0x1
	.byte	0x5f
	.long	0x62
	.long	.LLST19
	.uleb128 0x1e
	.long	0x396
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.byte	0x1
	.byte	0x67
	.long	0x799
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST20
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL63
	.long	0x1986
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL59
	.long	0x19db
	.long	0x7b0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x48
	.byte	0
	.uleb128 0x23
	.quad	.LVL61
	.long	0x627
	.long	0x7c8
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.quad	.LVL64
	.long	0x19c9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF82
	.byte	0x1
	.byte	0x97
	.long	0x9a
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ea
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x97
	.long	0x9a
	.long	.LLST21
	.uleb128 0x26
	.long	.LASF80
	.byte	0x1
	.byte	0x99
	.long	0x9a
	.long	.LLST22
	.uleb128 0x1e
	.long	0x396
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.byte	0x1
	.byte	0x9b
	.long	0x869
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST23
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL73
	.long	0x1986
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x2c
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	0x3c4
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.byte	0x1
	.byte	0x9e
	.long	0x8b1
	.uleb128 0x1f
	.long	0x3df
	.long	.LLST24
	.uleb128 0x1f
	.long	0x3d4
	.long	.LLST25
	.uleb128 0x21
	.quad	.LVL75
	.long	0x19f1
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL69
	.long	0x627
	.long	0x8c9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL70
	.long	0x19db
	.uleb128 0x21
	.quad	.LVL74
	.long	0x19c9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF83
	.byte	0x1
	.byte	0xa3
	.long	0x346
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x978
	.uleb128 0x18
	.string	"ls"
	.byte	0x1
	.byte	0xa3
	.long	0x346
	.long	.LLST26
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0xa3
	.long	0x9a
	.long	.LLST27
	.uleb128 0x23
	.quad	.LVL80
	.long	0x7dc
	.long	0x93e
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL81
	.long	0x6fd
	.uleb128 0x23
	.quad	.LVL84
	.long	0x1a0f
	.long	0x963
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.quad	.LVL87
	.long	0x8ea
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF84
	.byte	0x1
	.byte	0xb7
	.long	0x346
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0xa4d
	.uleb128 0x18
	.string	"ls"
	.byte	0x1
	.byte	0xb7
	.long	0x346
	.long	.LLST28
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0xb7
	.long	0x9a
	.long	.LLST29
	.uleb128 0x19
	.string	"ele"
	.byte	0x1
	.byte	0xb9
	.long	0x346
	.long	.LLST30
	.uleb128 0x28
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.long	0xa27
	.uleb128 0x26
	.long	.LASF54
	.byte	0x1
	.byte	0xbb
	.long	0x9a
	.long	.LLST31
	.uleb128 0x28
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.long	0xa0c
	.uleb128 0x26
	.long	.LASF55
	.byte	0x1
	.byte	0xbd
	.long	0x62
	.long	.LLST32
	.byte	0
	.uleb128 0x21
	.quad	.LVL94
	.long	0x1a0f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL100
	.long	0x7dc
	.long	0xa3f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL101
	.long	0x6fd
	.byte	0
	.uleb128 0x17
	.long	.LASF85
	.byte	0x1
	.byte	0xcc
	.long	0x346
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0xb56
	.uleb128 0x18
	.string	"ls"
	.byte	0x1
	.byte	0xcc
	.long	0x346
	.long	.LLST33
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0xcc
	.long	0x9a
	.long	.LLST34
	.uleb128 0x19
	.string	"ele"
	.byte	0x1
	.byte	0xce
	.long	0x346
	.long	.LLST35
	.uleb128 0x26
	.long	.LASF86
	.byte	0x1
	.byte	0xcf
	.long	0x346
	.long	.LLST36
	.uleb128 0x28
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.long	0xb0b
	.uleb128 0x26
	.long	.LASF54
	.byte	0x1
	.byte	0xd1
	.long	0x9a
	.long	.LLST37
	.uleb128 0x28
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.long	0xaf0
	.uleb128 0x26
	.long	.LASF55
	.byte	0x1
	.byte	0xd3
	.long	0x62
	.long	.LLST38
	.byte	0
	.uleb128 0x21
	.quad	.LVL109
	.long	0x1a0f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL116
	.long	0x7dc
	.long	0xb23
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL117
	.long	0x6fd
	.uleb128 0x23
	.quad	.LVL121
	.long	0x7dc
	.long	0xb48
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL122
	.long	0x6fd
	.byte	0
	.uleb128 0x17
	.long	.LASF87
	.byte	0x1
	.byte	0xf8
	.long	0x346
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0xc3d
	.uleb128 0x1d
	.long	.LASF88
	.byte	0x1
	.byte	0xf8
	.long	0x62
	.long	.LLST39
	.uleb128 0x19
	.string	"ls"
	.byte	0x1
	.byte	0xfa
	.long	0x346
	.long	.LLST40
	.uleb128 0x19
	.string	"ele"
	.byte	0x1
	.byte	0xfb
	.long	0x346
	.long	.LLST41
	.uleb128 0x26
	.long	.LASF89
	.byte	0x1
	.byte	0xfc
	.long	0xc3d
	.long	.LLST42
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0xfd
	.long	0x62
	.long	.LLST43
	.uleb128 0x19
	.string	"j"
	.byte	0x1
	.byte	0xfd
	.long	0x62
	.long	.LLST44
	.uleb128 0x19
	.string	"cnt"
	.byte	0x1
	.byte	0xfe
	.long	0x62
	.long	.LLST45
	.uleb128 0x23
	.quad	.LVL129
	.long	0x19ae
	.long	0xbf2
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x23
	.quad	.LVL148
	.long	0x1a29
	.long	0xc28
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x8
	.byte	0x76
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x9
	.byte	0x3
	.quad	compare_ele
	.byte	0
	.uleb128 0x21
	.quad	.LVL153
	.long	0x1a4a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x346
	.uleb128 0x29
	.long	.LASF90
	.byte	0x1
	.value	0x119
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0xcf2
	.uleb128 0x2a
	.string	"s"
	.byte	0x1
	.value	0x119
	.long	0x9a
	.long	.LLST46
	.uleb128 0x2b
	.long	.LASF91
	.byte	0x1
	.value	0x11a
	.long	0x351
	.long	.LLST47
	.uleb128 0x2b
	.long	.LASF92
	.byte	0x1
	.value	0x11a
	.long	0x2f3
	.long	.LLST48
	.uleb128 0x2b
	.long	.LASF93
	.byte	0x1
	.value	0x11b
	.long	0x371
	.long	.LLST49
	.uleb128 0x2c
	.long	.LASF94
	.byte	0x1
	.value	0x11d
	.long	0x62
	.long	.LLST50
	.uleb128 0x2d
	.quad	.LVL157
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.long	0xcc7
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2d
	.quad	.LVL158
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.long	0xcde
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x2e
	.quad	.LVL160
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.long	.LASF95
	.byte	0x1
	.value	0x129
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0xd1e
	.uleb128 0x2f
	.string	"in"
	.byte	0x1
	.value	0x129
	.long	0x3be
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x30
	.long	.LASF96
	.byte	0x1
	.value	0x132
	.long	0x9a
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0xdf5
	.uleb128 0x31
	.string	"s"
	.byte	0x1
	.value	0x134
	.long	0x9a
	.long	.LLST51
	.uleb128 0x32
	.long	0x3eb
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.byte	0x1
	.value	0x13b
	.long	0xda8
	.uleb128 0x1f
	.long	0x411
	.long	.LLST52
	.uleb128 0x1f
	.long	0x406
	.long	.LLST53
	.uleb128 0x1f
	.long	0x3fb
	.long	.LLST54
	.uleb128 0x21
	.quad	.LVL166
	.long	0x1a5c
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x400
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL164
	.long	0x1a7f
	.long	0xdcc
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.uleb128 0x21
	.quad	.LVL167
	.long	0x1a7f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.byte	0
	.uleb128 0x33
	.long	.LASF97
	.byte	0x1
	.value	0x149
	.long	0x9a
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0xfed
	.uleb128 0x2b
	.long	.LASF98
	.byte	0x1
	.value	0x149
	.long	0x62
	.long	.LLST55
	.uleb128 0x34
	.long	.LASF99
	.byte	0x1
	.value	0x14c
	.long	0xfed
	.uleb128 0x9
	.byte	0x3
	.quad	token_buf.3577
	.uleb128 0x34
	.long	.LASF100
	.byte	0x1
	.value	0x14d
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	first.3578
	.uleb128 0x34
	.long	.LASF101
	.byte	0x1
	.value	0x14e
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	bindex.3579
	.uleb128 0x34
	.long	.LASF102
	.byte	0x1
	.value	0x14f
	.long	0x1004
	.uleb128 0x9
	.byte	0x3
	.quad	sbuf.3580
	.uleb128 0x2c
	.long	.LASF103
	.byte	0x1
	.value	0x150
	.long	0x9a
	.long	.LLST56
	.uleb128 0x31
	.string	"i"
	.byte	0x1
	.value	0x151
	.long	0x62
	.long	.LLST57
	.uleb128 0x2c
	.long	.LASF94
	.byte	0x1
	.value	0x151
	.long	0x62
	.long	.LLST58
	.uleb128 0x2c
	.long	.LASF54
	.byte	0x1
	.value	0x161
	.long	0x9a
	.long	.LLST59
	.uleb128 0x35
	.long	.Ldebug_ranges0+0
	.long	0xf20
	.uleb128 0x2c
	.long	.LASF54
	.byte	0x1
	.value	0x158
	.long	0x9a
	.long	.LLST60
	.uleb128 0x32
	.long	0x3c4
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.byte	0x1
	.value	0x15c
	.long	0xf12
	.uleb128 0x1f
	.long	0x3df
	.long	.LLST61
	.uleb128 0x1f
	.long	0x3d4
	.long	.LLST62
	.uleb128 0x27
	.quad	.LVL178
	.long	0x19f1
	.byte	0
	.uleb128 0x27
	.quad	.LVL175
	.long	0xd1e
	.byte	0
	.uleb128 0x32
	.long	0x3c4
	.quad	.LBB58
	.quad	.LBE58-.LBB58
	.byte	0x1
	.value	0x165
	.long	0xf75
	.uleb128 0x1f
	.long	0x3df
	.long	.LLST63
	.uleb128 0x1f
	.long	0x3d4
	.long	.LLST64
	.uleb128 0x21
	.quad	.LVL182
	.long	0x19f1
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x14
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3577
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x3c4
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.byte	0x1
	.value	0x170
	.long	0xfbe
	.uleb128 0x1f
	.long	0x3df
	.long	.LLST65
	.uleb128 0x1f
	.long	0x3d4
	.long	.LLST66
	.uleb128 0x21
	.quad	.LVL192
	.long	0x19f1
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x27
	.quad	.LVL172
	.long	0xd1e
	.uleb128 0x27
	.quad	.LVL179
	.long	0xd1e
	.uleb128 0x21
	.quad	.LVL193
	.long	0x627
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0xa0
	.long	0x1004
	.uleb128 0xc
	.long	0x86
	.byte	0x9
	.uleb128 0x36
	.long	0x86
	.value	0x3ff
	.byte	0
	.uleb128 0xb
	.long	0xa0
	.long	0x1015
	.uleb128 0x36
	.long	0x86
	.value	0x3ff
	.byte	0
	.uleb128 0x29
	.long	.LASF104
	.byte	0x1
	.value	0x17f
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x11e6
	.uleb128 0x2a
	.string	"src"
	.byte	0x1
	.value	0x17f
	.long	0x3be
	.long	.LLST67
	.uleb128 0x2b
	.long	.LASF105
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST68
	.uleb128 0x2b
	.long	.LASF98
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST69
	.uleb128 0x2b
	.long	.LASF76
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST70
	.uleb128 0x2b
	.long	.LASF88
	.byte	0x1
	.value	0x17f
	.long	0x62
	.long	.LLST71
	.uleb128 0x2b
	.long	.LASF91
	.byte	0x1
	.value	0x180
	.long	0x351
	.long	.LLST72
	.uleb128 0x37
	.long	.LASF92
	.byte	0x1
	.value	0x180
	.long	0x2f3
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x37
	.long	.LASF93
	.byte	0x1
	.value	0x181
	.long	0x371
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x31
	.string	"s"
	.byte	0x1
	.value	0x183
	.long	0x9a
	.long	.LLST73
	.uleb128 0x31
	.string	"ls"
	.byte	0x1
	.value	0x184
	.long	0x346
	.long	.LLST74
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB63
	.quad	.LBE63-.LBB63
	.byte	0x1
	.value	0x18f
	.long	0x1114
	.uleb128 0x1f
	.long	0x42d
	.long	.LLST75
	.uleb128 0x21
	.quad	.LVL215
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB65
	.quad	.LBE65-.LBB65
	.byte	0x1
	.value	0x193
	.long	0x1161
	.uleb128 0x38
	.long	0x42d
	.uleb128 0xa
	.byte	0x3
	.quad	.LC5
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL219
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL207
	.long	0xcf2
	.long	0x117a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x23
	.quad	.LVL208
	.long	0x573
	.long	0x1192
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL210
	.long	0xc43
	.long	0x11b6
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL211
	.long	0xdf5
	.long	0x11ce
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.quad	.LVL212
	.long	0xb56
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x91
	.sleb128 -68
	.byte	0x94
	.byte	0x4
	.byte	0
	.byte	0
	.uleb128 0x33
	.long	.LASF106
	.byte	0x1
	.value	0x197
	.long	0x62
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x176c
	.uleb128 0x2b
	.long	.LASF107
	.byte	0x1
	.value	0x197
	.long	0x62
	.long	.LLST76
	.uleb128 0x2b
	.long	.LASF108
	.byte	0x1
	.value	0x197
	.long	0x176c
	.long	.LLST77
	.uleb128 0x34
	.long	.LASF105
	.byte	0x1
	.value	0x199
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x34
	.long	.LASF76
	.byte	0x1
	.value	0x19a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x34
	.long	.LASF109
	.byte	0x1
	.value	0x19b
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x34
	.long	.LASF110
	.byte	0x1
	.value	0x19c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x34
	.long	.LASF111
	.byte	0x1
	.value	0x19d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x34
	.long	.LASF98
	.byte	0x1
	.value	0x19e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x34
	.long	.LASF88
	.byte	0x1
	.value	0x19f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x34
	.long	.LASF112
	.byte	0x1
	.value	0x1a0
	.long	0x9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2c
	.long	.LASF113
	.byte	0x1
	.value	0x1a1
	.long	0x3be
	.long	.LLST78
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB67
	.quad	.LBE67-.LBB67
	.byte	0x1
	.value	0x1ac
	.long	0x12fe
	.uleb128 0x38
	.long	0x42d
	.uleb128 0xa
	.byte	0x3
	.quad	.LC14
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL237
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB69
	.quad	.LBE69-.LBB69
	.byte	0x1
	.value	0x1ad
	.long	0x134b
	.uleb128 0x38
	.long	0x42d
	.uleb128 0xa
	.byte	0x3
	.quad	.LC15
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL238
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB71
	.quad	.LBE71-.LBB71
	.byte	0x1
	.value	0x1ae
	.long	0x1398
	.uleb128 0x38
	.long	0x42d
	.uleb128 0xa
	.byte	0x3
	.quad	.LC16
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL239
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC16
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB73
	.quad	.LBE73-.LBB73
	.byte	0x1
	.value	0x1af
	.long	0x13e5
	.uleb128 0x38
	.long	0x42d
	.uleb128 0xa
	.byte	0x3
	.quad	.LC17
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL240
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC17
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x396
	.quad	.LBB75
	.quad	.LBE75-.LBB75
	.byte	0x1
	.value	0x1b1
	.long	0x1430
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST79
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL242
	.long	0x1ab5
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC18
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x396
	.quad	.LBB77
	.quad	.LBE77-.LBB77
	.byte	0x1
	.value	0x1b5
	.long	0x147b
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST80
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL245
	.long	0x1ab5
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x396
	.quad	.LBB79
	.quad	.LBE79-.LBB79
	.byte	0x1
	.value	0x1b9
	.long	0x14c6
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST81
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL248
	.long	0x1ab5
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC20
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x396
	.quad	.LBB81
	.quad	.LBE81-.LBB81
	.byte	0x1
	.value	0x1bf
	.long	0x1511
	.uleb128 0x1f
	.long	0x3b1
	.long	.LLST82
	.uleb128 0x20
	.long	0x3a6
	.uleb128 0x21
	.quad	.LVL254
	.long	0x1ab5
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	.LC22
	.byte	0
	.byte	0
	.uleb128 0x32
	.long	0x41d
	.quad	.LBB83
	.quad	.LBE83-.LBB83
	.byte	0x1
	.value	0x1c7
	.long	0x155e
	.uleb128 0x38
	.long	0x42d
	.uleb128 0xa
	.byte	0x3
	.quad	.LC24
	.byte	0x9f
	.uleb128 0x21
	.quad	.LVL258
	.long	0x1a9a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC24
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL227
	.long	0x1ad5
	.long	0x1584
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x23
	.quad	.LVL228
	.long	0x1ad5
	.long	0x15a9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x23
	.quad	.LVL229
	.long	0x1ad5
	.long	0x15ce
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x23
	.quad	.LVL230
	.long	0x1ad5
	.long	0x15f3
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x23
	.quad	.LVL231
	.long	0x1ad5
	.long	0x1618
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x23
	.quad	.LVL232
	.long	0x1ad5
	.long	0x163d
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x23
	.quad	.LVL233
	.long	0x1ad5
	.long	0x1662
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x23
	.quad	.LVL234
	.long	0x1aeb
	.long	0x1687
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x23
	.quad	.LVL235
	.long	0x1b01
	.long	0x16aa
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x27
	.quad	.LVL236
	.long	0x1b20
	.uleb128 0x23
	.quad	.LVL243
	.long	0x19c9
	.long	0x16ce
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x23
	.quad	.LVL246
	.long	0x19c9
	.long	0x16e5
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x23
	.quad	.LVL249
	.long	0x19c9
	.long	0x16fc
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x23
	.quad	.LVL250
	.long	0x1b31
	.long	0x171b
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC21
	.byte	0
	.uleb128 0x23
	.quad	.LVL255
	.long	0x19c9
	.long	0x1732
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x23
	.quad	.LVL256
	.long	0x1015
	.long	0x174a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x27
	.quad	.LVL257
	.long	0x1b4c
	.uleb128 0x21
	.quad	.LVL259
	.long	0x1b57
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9a
	.uleb128 0x39
	.long	.LASF159
	.byte	0x1
	.value	0x12f
	.long	0x177e
	.uleb128 0xd
	.long	0x9a
	.uleb128 0x3a
	.long	.LASF114
	.byte	0x6
	.byte	0xa8
	.long	0x270
	.uleb128 0x3a
	.long	.LASF115
	.byte	0x6
	.byte	0xa9
	.long	0x270
	.uleb128 0x3a
	.long	.LASF116
	.byte	0x6
	.byte	0xaa
	.long	0x270
	.uleb128 0x3b
	.long	.LASF117
	.byte	0x1
	.byte	0xe
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	wcnt
	.uleb128 0x3b
	.long	.LASF118
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	ucnt
	.uleb128 0x3b
	.long	.LASF119
	.byte	0x1
	.byte	0x10
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	mcnt
	.uleb128 0x3b
	.long	.LASF120
	.byte	0x1
	.byte	0x11
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	scnt
	.uleb128 0x3b
	.long	.LASF121
	.byte	0x1
	.byte	0x12
	.long	0x9a
	.uleb128 0x9
	.byte	0x3
	.quad	mstring
	.uleb128 0x3b
	.long	.LASF122
	.byte	0x1
	.byte	0x13
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	llen
	.uleb128 0x3b
	.long	.LASF123
	.byte	0x1
	.byte	0x14
	.long	0x9a
	.uleb128 0x9
	.byte	0x3
	.quad	lstring
	.uleb128 0x3b
	.long	.LASF124
	.byte	0x1
	.byte	0x15
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	lcnt
	.uleb128 0xb
	.long	0x2f3
	.long	0x185c
	.uleb128 0xc
	.long	0x86
	.byte	0x1
	.byte	0
	.uleb128 0x3b
	.long	.LASF125
	.byte	0x1
	.byte	0x33
	.long	0x184c
	.uleb128 0x9
	.byte	0x3
	.quad	lower_fun_set
	.uleb128 0xb
	.long	0x9a
	.long	0x1881
	.uleb128 0xc
	.long	0x86
	.byte	0x1
	.byte	0
	.uleb128 0x3b
	.long	.LASF126
	.byte	0x1
	.byte	0x34
	.long	0x1871
	.uleb128 0x9
	.byte	0x3
	.quad	lower_fun_names
	.uleb128 0x3b
	.long	.LASF127
	.byte	0x1
	.byte	0x4f
	.long	0xc3d
	.uleb128 0x9
	.byte	0x3
	.quad	htable
	.uleb128 0x3b
	.long	.LASF128
	.byte	0x1
	.byte	0x50
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	tsize
	.uleb128 0xb
	.long	0x351
	.long	0x18d0
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x3b
	.long	.LASF129
	.byte	0x1
	.byte	0x94
	.long	0x18c0
	.uleb128 0x9
	.byte	0x3
	.quad	hash_fun_set
	.uleb128 0xb
	.long	0x9a
	.long	0x18f5
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x3b
	.long	.LASF130
	.byte	0x1
	.byte	0x95
	.long	0x18e5
	.uleb128 0x9
	.byte	0x3
	.quad	hash_fun_names
	.uleb128 0xb
	.long	0x371
	.long	0x191a
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x3b
	.long	.LASF131
	.byte	0x1
	.byte	0xea
	.long	0x190a
	.uleb128 0x9
	.byte	0x3
	.quad	find_ele_fun_set
	.uleb128 0x3b
	.long	.LASF132
	.byte	0x1
	.byte	0xec
	.long	0x18e5
	.uleb128 0x9
	.byte	0x3
	.quad	find_ele_fun_names
	.uleb128 0x3c
	.string	"buf"
	.byte	0x1
	.value	0x125
	.long	0x1004
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x3d
	.long	.LASF133
	.byte	0x1
	.value	0x126
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	bufvalid
	.uleb128 0x3d
	.long	.LASF113
	.byte	0x1
	.value	0x127
	.long	0x3be
	.uleb128 0x9
	.byte	0x3
	.quad	infile
	.uleb128 0x3e
	.long	.LASF134
	.byte	0xa
	.byte	0
	.long	.LASF138
	.long	0x38
	.long	0x19ae
	.uleb128 0x10
	.long	0x2ec
	.uleb128 0x10
	.long	0x38
	.uleb128 0x10
	.long	0x38
	.uleb128 0x10
	.long	0x98
	.byte	0
	.uleb128 0x3f
	.long	.LASF135
	.byte	0x9
	.value	0x1d4
	.long	0x98
	.long	0x19c9
	.uleb128 0x10
	.long	0x2d
	.uleb128 0x10
	.long	0x2d
	.byte	0
	.uleb128 0x40
	.long	.LASF140
	.byte	0x9
	.value	0x21f
	.long	0x19db
	.uleb128 0x10
	.long	0x62
	.byte	0
	.uleb128 0x3f
	.long	.LASF136
	.byte	0x9
	.value	0x1d2
	.long	0x98
	.long	0x19f1
	.uleb128 0x10
	.long	0x2d
	.byte	0
	.uleb128 0x3e
	.long	.LASF137
	.byte	0xa
	.byte	0
	.long	.LASF63
	.long	0x9a
	.long	0x1a0f
	.uleb128 0x10
	.long	0x9a
	.uleb128 0x10
	.long	0x29c
	.byte	0
	.uleb128 0x41
	.long	.LASF139
	.byte	0xb
	.byte	0x90
	.long	0x62
	.long	0x1a29
	.uleb128 0x10
	.long	0x29c
	.uleb128 0x10
	.long	0x29c
	.byte	0
	.uleb128 0x40
	.long	.LASF141
	.byte	0x9
	.value	0x2fd
	.long	0x1a4a
	.uleb128 0x10
	.long	0x98
	.uleb128 0x10
	.long	0x2d
	.uleb128 0x10
	.long	0x2d
	.uleb128 0x10
	.long	0x2c6
	.byte	0
	.uleb128 0x40
	.long	.LASF142
	.byte	0x9
	.value	0x1e3
	.long	0x1a5c
	.uleb128 0x10
	.long	0x98
	.byte	0
	.uleb128 0x3e
	.long	.LASF143
	.byte	0x2
	.byte	0xf3
	.long	.LASF66
	.long	0x9a
	.long	0x1a7f
	.uleb128 0x10
	.long	0x9a
	.uleb128 0x10
	.long	0x62
	.uleb128 0x10
	.long	0x3be
	.byte	0
	.uleb128 0x3f
	.long	.LASF144
	.byte	0xb
	.value	0x15c
	.long	0x9a
	.long	0x1a9a
	.uleb128 0x10
	.long	0x9a
	.uleb128 0x10
	.long	0x29c
	.byte	0
	.uleb128 0x41
	.long	.LASF145
	.byte	0x2
	.byte	0x57
	.long	0x62
	.long	0x1ab5
	.uleb128 0x10
	.long	0x62
	.uleb128 0x10
	.long	0x29c
	.uleb128 0x15
	.byte	0
	.uleb128 0x41
	.long	.LASF146
	.byte	0x2
	.byte	0x55
	.long	0x62
	.long	0x1ad5
	.uleb128 0x10
	.long	0x3be
	.uleb128 0x10
	.long	0x62
	.uleb128 0x10
	.long	0x29c
	.uleb128 0x15
	.byte	0
	.uleb128 0x42
	.long	.LASF147
	.byte	0xc
	.byte	0x9
	.long	0x1aeb
	.uleb128 0x10
	.long	0x9a
	.uleb128 0x10
	.long	0x2a7
	.byte	0
	.uleb128 0x42
	.long	.LASF148
	.byte	0xc
	.byte	0xb
	.long	0x1b01
	.uleb128 0x10
	.long	0x9a
	.uleb128 0x10
	.long	0x176c
	.byte	0
	.uleb128 0x41
	.long	.LASF149
	.byte	0xc
	.byte	0x15
	.long	0x62
	.long	0x1b20
	.uleb128 0x10
	.long	0x62
	.uleb128 0x10
	.long	0x176c
	.uleb128 0x10
	.long	0x176c
	.byte	0
	.uleb128 0x42
	.long	.LASF150
	.byte	0xc
	.byte	0x1b
	.long	0x1b31
	.uleb128 0x10
	.long	0x3be
	.byte	0
	.uleb128 0x3f
	.long	.LASF151
	.byte	0x6
	.value	0x110
	.long	0x3be
	.long	0x1b4c
	.uleb128 0x10
	.long	0x29c
	.uleb128 0x10
	.long	0x29c
	.byte	0
	.uleb128 0x43
	.long	.LASF160
	.byte	0x8
	.byte	0xbd
	.long	0x2b4
	.uleb128 0x44
	.long	.LASF152
	.byte	0x6
	.byte	0xed
	.long	0x62
	.uleb128 0x10
	.long	0x3be
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2113
	.uleb128 0x18
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2113
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL1-.Ltext0
	.quad	.LFE36-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL6-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL2-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL4-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL8-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL12-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL11-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL14-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL13-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL15-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL18-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL21-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL22-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL21-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL24-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL28-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL31-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL23-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x9
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL30-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x9
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x26
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL34-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL35-.Ltext0
	.quad	.LVL36-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	tsize
	.quad	.LVL36-1-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL37-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC0
	.byte	0x9f
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL40-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL44-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL49-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL43-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL44-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL51-1-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL56-.Ltext0
	.quad	.LFE32-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL52-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL58-.Ltext0
	.quad	.LVL67-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL67-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL60-.Ltext0
	.quad	.LVL61-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL61-1-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL66-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL61-.Ltext0
	.quad	.LVL63-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL64-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL62-.Ltext0
	.quad	.LVL64-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL68-.Ltext0
	.quad	.LVL69-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL69-1-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL77-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL71-.Ltext0
	.quad	.LVL73-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL73-1-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL75-1-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL76-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL72-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC2
	.byte	0x9f
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL74-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL77-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL74-.Ltext0
	.quad	.LVL75-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL75-1-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL76-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL79-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL85-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL86-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL88-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL78-.Ltext0
	.quad	.LVL80-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL80-1-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL82-.Ltext0
	.quad	.LVL83-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL83-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL89-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL90-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL92-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL96-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL97-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL104-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL90-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL92-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL103-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL91-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL92-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL101-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL93-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL95-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL105-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL107-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL111-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL112-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL119-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL120-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL125-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL105-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL107-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL119-.Ltext0
	.quad	.LVL121-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL121-1-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL124-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL107-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL113-.Ltext0
	.quad	.LVL116-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL117-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x2
	.byte	0x73
	.sleb128 16
	.quad	.LVL119-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL120-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL106-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL112-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL115-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL119-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL108-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL110-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL126-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL128-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL149-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL127-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL149-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL155-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL133-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST42:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL132-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL147-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST43:
	.quad	.LVL131-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL132-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL144-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x3
	.byte	0x79
	.sleb128 1
	.byte	0x9f
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST44:
	.quad	.LVL134-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL136-.Ltext0
	.quad	.LVL137-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL137-.Ltext0
	.quad	.LVL138-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL138-.Ltext0
	.quad	.LVL139-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL139-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL140-.Ltext0
	.quad	.LVL141-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL149-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST45:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL132-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST46:
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL157-1-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL161-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST47:
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL157-1-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL159-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST48:
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL157-1-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST49:
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL157-1-.Ltext0
	.quad	.LVL162-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL162-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST50:
	.quad	.LVL158-.Ltext0
	.quad	.LVL160-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST51:
	.quad	.LVL164-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL167-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST52:
	.quad	.LVL165-.Ltext0
	.quad	.LVL166-1-.Ltext0
	.value	0x9
	.byte	0x3
	.quad	infile
	.quad	0
	.quad	0
.LLST53:
	.quad	.LVL165-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x4
	.byte	0xa
	.value	0x400
	.byte	0x9f
	.quad	0
	.quad	0
.LLST54:
	.quad	.LVL165-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	buf
	.byte	0x9f
	.quad	0
	.quad	0
.LLST55:
	.quad	.LVL170-.Ltext0
	.quad	.LVL172-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL172-1-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL173-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL174-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL205-.Ltext0
	.quad	.LFE48-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST56:
	.quad	.LVL171-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	sbuf.3580
	.byte	0x9f
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL188-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL190-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL194-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL199-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	sbuf.3580
	.byte	0x9f
	.quad	0
	.quad	0
.LLST57:
	.quad	.LVL186-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL187-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL197-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL203-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST58:
	.quad	.LVL183-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0xf
	.byte	0x3
	.quad	bindex.3579
	.byte	0x94
	.byte	0x4
	.byte	0x7d
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL185-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL203-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST59:
	.quad	.LVL179-.Ltext0
	.quad	.LVL182-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL187-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL191-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL201-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST60:
	.quad	.LVL175-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL199-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST61:
	.quad	.LVL176-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST62:
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x15
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3577
	.byte	0x22
	.byte	0x9f
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST63:
	.quad	.LVL180-.Ltext0
	.quad	.LVL182-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST64:
	.quad	.LVL180-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x15
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3577
	.byte	0x22
	.byte	0x9f
	.quad	.LVL181-.Ltext0
	.quad	.LVL182-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL182-1-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x15
	.byte	0x73
	.sleb128 -1
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x8
	.byte	0x20
	.byte	0x26
	.byte	0x3a
	.byte	0x24
	.byte	0x3
	.quad	token_buf.3577
	.byte	0x22
	.byte	0x9f
	.quad	0
	.quad	0
.LLST65:
	.quad	.LVL187-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL191-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST66:
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL191-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST67:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL207-1-.Ltext0
	.quad	.LFE49-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST68:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST69:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL213-.Ltext0
	.quad	.LFE49-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST70:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL222-.Ltext0
	.quad	.LFE49-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST71:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL207-1-.Ltext0
	.quad	.LFE49-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -68
	.quad	0
	.quad	0
.LLST72:
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL207-1-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL220-.Ltext0
	.quad	.LFE49-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.quad	0
	.quad	0
.LLST73:
	.quad	.LVL209-.Ltext0
	.quad	.LVL210-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST74:
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL214-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST75:
	.quad	.LVL214-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC4
	.byte	0x9f
	.quad	0
	.quad	0
.LLST76:
	.quad	.LVL223-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL226-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL261-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST77:
	.quad	.LVL223-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL225-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL262-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST78:
	.quad	.LVL224-.Ltext0
	.quad	.LVL251-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL251-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL253-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST79:
	.quad	.LVL241-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC18
	.byte	0x9f
	.quad	0
	.quad	0
.LLST80:
	.quad	.LVL244-.Ltext0
	.quad	.LVL246-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC19
	.byte	0x9f
	.quad	0
	.quad	0
.LLST81:
	.quad	.LVL247-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC20
	.byte	0x9f
	.quad	0
	.quad	0
.LLST82:
	.quad	.LVL252-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC22
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB55-.Ltext0
	.quad	.LBE55-.Ltext0
	.quad	.LBB62-.Ltext0
	.quad	.LBE62-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF127:
	.string	"htable"
.LASF86:
	.string	"last"
.LASF33:
	.string	"_shortbuf"
.LASF156:
	.string	"_IO_lock_t"
.LASF116:
	.string	"stderr"
.LASF22:
	.string	"_IO_buf_end"
.LASF137:
	.string	"__builtin_strcpy"
.LASF111:
	.string	"find_fun_index"
.LASF119:
	.string	"mcnt"
.LASF131:
	.string	"find_ele_fun_set"
.LASF101:
	.string	"bindex"
.LASF20:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF56:
	.string	"next"
.LASF159:
	.string	"skipchar"
.LASF14:
	.string	"_flags"
.LASF26:
	.string	"_markers"
.LASF134:
	.string	"__builtin_fwrite"
.LASF92:
	.string	"lower_fun"
.LASF68:
	.string	"h_mod"
.LASF109:
	.string	"hash_fun_index"
.LASF135:
	.string	"calloc"
.LASF121:
	.string	"mstring"
.LASF59:
	.string	"find_ele_fun_t"
.LASF47:
	.string	"_pos"
.LASF63:
	.string	"strcpy"
.LASF115:
	.string	"stdout"
.LASF25:
	.string	"_IO_save_end"
.LASF88:
	.string	"quick"
.LASF136:
	.string	"malloc"
.LASF94:
	.string	"index"
.LASF80:
	.string	"result"
.LASF50:
	.string	"long long unsigned int"
.LASF52:
	.string	"lower_fun_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF35:
	.string	"_offset"
.LASF97:
	.string	"get_token"
.LASF49:
	.string	"clock_t"
.LASF64:
	.string	"__dest"
.LASF62:
	.string	"fprintf"
.LASF28:
	.string	"_fileno"
.LASF104:
	.string	"word_freq"
.LASF83:
	.string	"find_ele_rec"
.LASF7:
	.string	"size_t"
.LASF150:
	.string	"show_options"
.LASF17:
	.string	"_IO_read_base"
.LASF107:
	.string	"argc"
.LASF114:
	.string	"stdin"
.LASF74:
	.string	"ele1"
.LASF75:
	.string	"ele2"
.LASF45:
	.string	"_next"
.LASF155:
	.string	"/nfs/student/l/litran117/cs341-fall16/lab4"
.LASF142:
	.string	"free"
.LASF55:
	.string	"freq"
.LASF61:
	.string	"__fmt"
.LASF160:
	.string	"clock"
.LASF87:
	.string	"sort_words"
.LASF147:
	.string	"add_int_option"
.LASF113:
	.string	"infile"
.LASF60:
	.string	"__stream"
.LASF120:
	.string	"scnt"
.LASF12:
	.string	"char"
.LASF146:
	.string	"__fprintf_chk"
.LASF41:
	.string	"_mode"
.LASF78:
	.string	"lower1"
.LASF79:
	.string	"lower2"
.LASF44:
	.string	"_IO_marker"
.LASF141:
	.string	"qsort"
.LASF15:
	.string	"_IO_read_ptr"
.LASF140:
	.string	"exit"
.LASF122:
	.string	"llen"
.LASF139:
	.string	"strcmp"
.LASF90:
	.string	"insert_string"
.LASF102:
	.string	"sbuf"
.LASF130:
	.string	"hash_fun_names"
.LASF124:
	.string	"lcnt"
.LASF18:
	.string	"_IO_write_base"
.LASF158:
	.string	"new_ele"
.LASF125:
	.string	"lower_fun_set"
.LASF48:
	.string	"long long int"
.LASF67:
	.string	"printf"
.LASF72:
	.string	"vele1"
.LASF73:
	.string	"vele2"
.LASF23:
	.string	"_IO_save_base"
.LASF70:
	.string	"h_xor"
.LASF154:
	.string	"dictionary.c"
.LASF128:
	.string	"tsize"
.LASF145:
	.string	"__printf_chk"
.LASF110:
	.string	"lower_fun_index"
.LASF53:
	.string	"HELE"
.LASF153:
	.string	"GNU C 4.8.4 -msse4 -mfpmath=sse -m64 -mtune=generic -march=x86-64 -g -O1 -fno-inline -fno-optimize-sibling-calls -fstack-protector"
.LASF99:
	.string	"token_buf"
.LASF51:
	.string	"__compar_fn_t"
.LASF76:
	.string	"size"
.LASF118:
	.string	"ucnt"
.LASF36:
	.string	"__pad1"
.LASF37:
	.string	"__pad2"
.LASF38:
	.string	"__pad3"
.LASF39:
	.string	"__pad4"
.LASF40:
	.string	"__pad5"
.LASF84:
	.string	"find_ele_iter_f"
.LASF11:
	.string	"__clock_t"
.LASF112:
	.string	"fname"
.LASF85:
	.string	"find_ele_iter_r"
.LASF151:
	.string	"fopen"
.LASF32:
	.string	"_vtable_offset"
.LASF96:
	.string	"get_word"
.LASF93:
	.string	"find_ele_fun"
.LASF123:
	.string	"lstring"
.LASF66:
	.string	"fgets"
.LASF89:
	.string	"array"
.LASF108:
	.string	"argv"
.LASF133:
	.string	"bufvalid"
.LASF69:
	.string	"h_add"
.LASF126:
	.string	"lower_fun_names"
.LASF77:
	.string	"Strlen"
.LASF57:
	.string	"h_ptr"
.LASF16:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF6:
	.string	"long int"
.LASF81:
	.string	"wlen"
.LASF157:
	.string	"new_table"
.LASF117:
	.string	"wcnt"
.LASF54:
	.string	"word"
.LASF152:
	.string	"fclose"
.LASF98:
	.string	"ngram"
.LASF148:
	.string	"add_string_option"
.LASF91:
	.string	"hash_fun"
.LASF82:
	.string	"save_string"
.LASF143:
	.string	"__fgets_alias"
.LASF34:
	.string	"_lock"
.LASF95:
	.string	"init_token"
.LASF10:
	.string	"sizetype"
.LASF0:
	.string	"long unsigned int"
.LASF30:
	.string	"_old_offset"
.LASF43:
	.string	"_IO_FILE"
.LASF132:
	.string	"find_ele_fun_names"
.LASF1:
	.string	"unsigned char"
.LASF103:
	.string	"nextpos"
.LASF46:
	.string	"_sbuf"
.LASF65:
	.string	"__src"
.LASF19:
	.string	"_IO_write_ptr"
.LASF100:
	.string	"first"
.LASF144:
	.string	"strtok"
.LASF138:
	.string	"fwrite"
.LASF8:
	.string	"__off_t"
.LASF105:
	.string	"verbose"
.LASF149:
	.string	"parse_options"
.LASF4:
	.string	"signed char"
.LASF2:
	.string	"short unsigned int"
.LASF106:
	.string	"main"
.LASF71:
	.string	"compare_ele"
.LASF58:
	.string	"hash_fun_t"
.LASF27:
	.string	"_chain"
.LASF13:
	.string	"FILE"
.LASF129:
	.string	"hash_fun_set"
.LASF29:
	.string	"_flags2"
.LASF31:
	.string	"_cur_column"
.LASF9:
	.string	"__off64_t"
.LASF42:
	.string	"_unused2"
.LASF21:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
