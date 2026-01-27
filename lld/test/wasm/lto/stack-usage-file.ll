; RUN: llvm-as %s -o %t.o
; RUN: wasm-ld --entry f %t.o -o %t.wasm -mllvm -stack-usage-file=%t.su
; RUN: FileCheck --input-file=%t.su %s

target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

define void @f() {
  %a = alloca [64 x i8]
  ret void
}

; CHECK: f {{[0-9]+}} static
