(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (i32.const 1)
  (call $printBool)
  (i32.const 0)
  (call $printBool)
  (i32.const 1)
  (call $printBool)
  (i32.const 1)
  (call $printBool)
  (i32.const 1)
  (call $printBool)
  (i32.const 0)
  (call $printBool)
  (i32.const 0)
  return
 )
 (func
  $printBool
  (param $bb$0 i32)
  (local.get $bb$0)
  (if (then (i32.const 1) (call $printInt)) (else (i32.const 0) (call $printInt)))
 )
 (func $test (param $ii$0 i32) (result i32) (local.get $ii$0) (i32.const 0) i32.gt_s return)
 (export "main" (func $main))
)