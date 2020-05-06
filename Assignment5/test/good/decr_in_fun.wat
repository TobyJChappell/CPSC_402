(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $f (param $iy$0 i32) (result i32) return)
 (func $main (result i32) (i32.const 0) return)
 (export "main" (func $main))
)