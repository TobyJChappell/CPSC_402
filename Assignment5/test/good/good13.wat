(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (local $in$0 i32)
  (local $ii$0 i32)
  (local $biPrime$2 i32)
  (local $ij$2 i32)
  (call $readInt)
  (local.set $in$0)
  (i32.const 2)
  (local.set $ii$0)
  (block
   (loop
    (local.get $ii$0)
    (local.get $in$0)
    i32.le_s
    (f64.const 0.0)
    f64.le
    (br_if 1)
    (i32.const 1)
    (local.set $biPrime$2)
    (i32.const 2)
    (local.set $ij$2)
    (block
     (loop
      (i32.const 1)
      (f64.const 0.0)
      f64.le
      (br_if 3)
      (local.get $ij$2)
      (i32.const 1)
      i32.add
      (local.set $ij$2)
      (local.get $ij$2)
      (br 2)
     )
    )
    (br 0)
   )
  )
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)