; REQUIRES: x86-registered-target

; RUN: llvm-as < %s > %t1.bc
; RUN: llvm-lto2 run %t1.bc -o %t.o -r %t1.bc,f,px -lto-stack-usage-file=%t.su
; RUN: FileCheck --input-file=%t.su %s

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f() {
  %a = alloca [64 x i8]
  ret void
}

; CHECK: f {{[0-9]+}} static
