(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $id (param $ix$0 i32) (result i32) (local.get $ix$0) return)
 (func
  $main
  (result i32)
  (local $iz$0 i32)
  (i32.const 0)
  (local.set $iz$0)
  (call $id)
  drop
  (local.get $iz$0)
  (call $printInt)
  (local.get $iz$0)
  (i32.const 1)
  i32.add
  (local.set $iz$0)
  (local.tee $iz$0)
  (call $id)
  drop
  (local.get $iz$0)
  (call $printInt)
  i32.add
  (local.get $iz$0)
  (call $printInt)
  i32.eq
  (local.get $iz$0)
  (call $printInt)
  (local.get $iz$0)
  (call $printInt)
  (local.get $iz$0)
  (call $printInt)
  (local.get $iz$0)
  (call $printInt)
  (local.get $iz$0)
  (call $printInt)
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)