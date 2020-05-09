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
    (i32.const 0)
    i32.le_s
    (br_if 1)
    (i32.const 1)
    (local.set $biPrime$2)
    (i32.const 2)
    (local.set $ij$2)
    (block
     (loop
      (local.get $ij$2)
      (local.get $ij$2)
      i32.mul
      (local.get $ii$0)
      i32.le_s
      (i32.const 0)
      i32.gt_s
      (local.get $biPrime$2)
      (i32.const 0)
      i32.gt_s
      i32.add
      (i32.const 2)
      i32.eq
      (i32.const 0)
      i32.le_s
      (br_if 3)
      (local.get $ii$0)
      (local.get $ij$2)
      i32.div_s
      (local.get $ij$2)
      i32.mul
      (local.get $ii$0)
      i32.eq
      (if (then (i32.const 0) (local.set $biPrime$2)) (else))
      (local.get $ij$2)
      (i32.const 1)
      i32.add
      (local.set $ij$2)
      (br 2)
     )
    )
    (local.get $biPrime$2)
    (i32.const 0)
    i32.gt_s
    (local.get $in$0)
    (local.get $ii$0)
    i32.div_s
    (local.get $ii$0)
    i32.mul
    (local.get $in$0)
    i32.eq
    (i32.const 0)
    i32.gt_s
    i32.add
    (i32.const 2)
    i32.eq
    (if
     (then (local.get $ii$0) (call $printInt) (local.get $in$0) (local.get $ii$0) i32.div_s (local.set $in$0))
     (else (local.get $ii$0) (i32.const 1) i32.add (local.set $ii$0))
    )
    (br 0)
   )
  )
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)