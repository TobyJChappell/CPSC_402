(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (local $iy$0 i32)
  (i32.const 17)
  (local.set $iy$0)
  (block
   (loop
    (local.get $iy$0)
    (i32.const 2)
    i32.sub
    (local.set $iy$0)
    (local.get $iy$0)
    (i32.const 0)
    i32.gt_s
    (br_if 0)
    (br 1)
   )
  )
 )
 (export "main" (func $main))
)