; REQUIRES: x86

; RUN: llvm-as -o %t.bc %s
; RUN: ld.lld --lto-stack-usage-file=%t.su -m elf_x86_64 -r -o %t.o %t.bc
; RUN: FileCheck --input-file=%t.su %s

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f() {
  %a = alloca [64 x i8]
  ret void
}

; CHECK: f {{[0-9]+}} static
