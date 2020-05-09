(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func
  $main
  (result i32)
  (local $ilo$0 i32)
  (local $ihi$0 i32)
  (local $imx$0 i32)
  (i32.const 1)
  (local.set $ilo$0)
  (local.get $ilo$0)
  (local.set $ihi$0)
  (call $readInt)
  (local.set $imx$0)
  (local.get $ilo$0)
  (call $printInt)
  (block
   (loop
    (local.get $ihi$0)
    (call $printInt)
    (local.get $ilo$0)
    (local.get $ihi$0)
    i32.add
    (local.set $ihi$0)
    (local.get $ihi$0)
    (local.get $ilo$0)
    i32.sub
    (local.set $ilo$0)
    (local.get $ihi$0)
    (local.get $imx$0)
    i32.lt_s
    (br_if 0)
    (br 1)
   )
  )
  (i32.const 0)
  return
 )
 (export "main" (func $main))
)