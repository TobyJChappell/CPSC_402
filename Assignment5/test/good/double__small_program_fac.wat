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
  (i32.const 10)
  (local.set $in$1)
  (i32.const 1)
  (local.set $ir$1)
  (block
   (loop
    (local.get $ir$1)
    (local.get $in$1)
    i32.mul
    (local.set $ir$1)
    (local.get $in$1)
    (i32.const 1)
    i32.sub
    (local.set $in$1)
    (local.get $in$1)
    (i32.const 0)
    i32.gt_s
    (br_if 1)
    (br 2)
   )
  )
  (local.get $ir$1)
  (call $printInt)
  (f64.const 10.0)
  (call $dfac)
  (call $printDouble)
  (i32.const 0)
  return
 )
 (func $dfac (param $dn$0 f64) (result f64) (local $df$0 f64) (local.get $df$0) return)
 (export "main" (func $main))
)