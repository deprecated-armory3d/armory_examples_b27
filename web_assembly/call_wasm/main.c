#define WASM_EXPORT __attribute__((visibility("default")))

WASM_EXPORT
float test() {
  return 0.01f;
}
