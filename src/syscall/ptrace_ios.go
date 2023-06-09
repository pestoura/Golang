// Copyright 2020 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//go:build ios

package syscall

import "unsafe"

// Nosplit because it is called from forkAndExecInChild.
//
//go:nosplit
func ptrace(request int, pid int, addr uintptr, data uintptr) (err error) {
	panic("unimplemented")
}

//go:nosplit
func ptracePtr(request int, pid int, addr unsafe.Pointer, data uintptr) (err error) {
	panic("unimplemented")
}
