(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $c (param $id$0 i32) (result i32) (local.get $id$0) (local.get $id$0) i32.lt_s return)
 (func
  $main
  (result i32)
  (i32.const 0)
  (call $c)
  (f64.const 0.0)
  f64.gt
  (if (result i32) (then (i32.const 1) (call $printInt)) (else (i32.const 0) (call $printInt)))
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)