(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (local $dx$0 f64)
  (f64.const 0.0)
  (local.set $dx$0)
  (block
   (loop
    (local.get $dx$0)
    (f64.const 5.0)
    f64.lt
    (i32.const 0)
    i32.le_s
    (br_if 1)
    (local.get $dx$0)
    (call $printDouble)
    (local.get $dx$0)
    (f64.const 1.0)
    f64.add
    (local.set $dx$0)
    (local.get $dx$0)
    (br 0)
   )
  )
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)