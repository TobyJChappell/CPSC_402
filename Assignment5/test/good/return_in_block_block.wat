(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $niam (result i32) (i32.const 1) (call $printInt))
 (func $main (result i32) (i32.const 4) (call $printInt))
 (export "main" (func $main))
)