; REQUIRES: x86

; RUN: llvm-as %s -o %t.obj
; RUN: lld-link /subsystem:console /entry:f /out:%t.exe /lto-stack-usage-file:%t.su %t.obj
; RUN: FileCheck --input-file=%t.su %s

target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.0.24215"

define void @f() {
  %a = alloca [64 x i8]
  ret void
}

; CHECK: f {{[0-9]+}} static
