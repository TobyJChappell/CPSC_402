(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $main (result i32) (i32.const 17) (call $ev) (call $printInt) (i32.const 0) return)
 (func $ev (param $iy$0 i32) (result i32) (local $ie$0 i32) (local.get $ie$0) return)
 (export "main" (func $main))
)