(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $order (param $ia$0 i32) (param $ib$0 i32) (result i32) (i32.const 0) return)
 (func $printIntInt (param $ii$0 i32) (result i32) return)
 (func $printIntBool (param $ii$0 i32) (result i32) (i32.const 1) return)
 (func
  $main
  (result i32)
  i32.eq
  i32.mul
  i32.div_s
  i32.sub
  i32.lt_s
  i32.gt_s
  i32.le_s
  i32.ge_s
  i32.ne
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)