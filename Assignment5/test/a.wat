(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (local $dr$0 f64)
  (local $in$1 i32)
  (local $ir$1 i32)
  (block
   (i32.const 10)
   (local.set $in$1)
   (i32.const 1)
   (local.set $ir$1)
   (block
    (loop
     (local.get $in$1)
     (i32.const 0)
     i32.gt_s
     i32.eqz
     (br_if 2)
     (block
      (local.get $ir$1)
      (local.get $in$1)
      i32.mul
      (local.set $ir$1)
      (local.get $in$1)
      (i32.const 1)
      i32.sub
      (local.set $in$1)
      (br 2)
     )
     (br 1)
    )
   )
   (local.get $ir$1)
   (call $printInt)
   (br 0)
  )
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)