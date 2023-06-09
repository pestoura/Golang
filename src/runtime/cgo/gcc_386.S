// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

.file "gcc_386.S"

/*
 * Windows still insists on underscore prefixes for C function names.
 */
#if defined(_WIN32)
#define EXT(s) _##s
#else
#define EXT(s) s
#endif

/*
 * void crosscall_386(void (*fn)(void))
 *
 * Calling into the 8c tool chain, where all registers are caller save.
 * Called from standard x86 ABI, where %ebp, %ebx, %esi,
 * and %edi are callee-save, so they must be saved explicitly.
 */
.globl EXT(crosscall_386)
EXT(crosscall_386):
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	movl 8(%ebp), %eax	/* fn */
	call *%eax

	popl %edi
	popl %esi
	popl %ebx
	popl %ebp
	ret

#ifdef __ELF__
.section .note.GNU-stack,"",@progbits
#endif
