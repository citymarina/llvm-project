; REQUIRES: x86

; RUN: rm -rf %t; mkdir %t
; RUN: llvm-as %s -o %t/test.o
; RUN: %lld %t/test.o -o %t/test -mllvm -stack-usage-file=%t/test.su
; RUN: FileCheck --input-file=%t/test.su %s

target triple = "x86_64-apple-macosx10.15.0"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

define void @main() {
  %a = alloca [64 x i8]
  ret void
}

; CHECK: main {{[0-9]+}} static
