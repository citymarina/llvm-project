// RUN: %clang -target aarch64-unknown %s -### 2>&1 | FileCheck %s --check-prefix=CHECK-ABSENT
// CHECK-ABSENT-NOT: "-stack-usage-file"

// RUN: %clang -target aarch64-unknown -fstack-usage %s -### 2>&1 | FileCheck %s --check-prefix=CHECK-PRESENT
// CHECK-PRESENT: "-stack-usage-file"

// RUN: %clang --target=arm64-apple-darwin -fstack-usage -flto %s -### -o foo 2>&1 | FileCheck %s --check-prefix=DARWIN-LTO
// DARWIN-LTO: "-mllvm" "-stack-usage-file=foo.su"

// RUN: %clang --target=arm64-apple-darwin -flto %s -### -o foo 2>&1 | FileCheck %s --check-prefix=DARWIN-LTO-ABSENT
// DARWIN-LTO-ABSENT-NOT: "-stack-usage-file"

int foo() { return 42; }
