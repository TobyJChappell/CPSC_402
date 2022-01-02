(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (local $in$1 i32)
  (i32.const 10)
  (local.set $in$1)
  (block
   (loop
    (local.get $in$1)
    (i32.const 0)
    i32.gt_s
    i32.eqz
    (br_if 1)
    (local.get $in$1)
    (i32.const 1)
    i32.sub
    (local.set $in$1)
    (br 0)
   )
  )
  (local.get $in$1)
  (call $printInt)
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)