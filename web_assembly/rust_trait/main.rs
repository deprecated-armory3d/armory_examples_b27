extern {
  fn notify_on_update(f: extern fn() -> ()) -> ();
  fn get_object(name: *const i8) -> i32;
  fn set_transform(object: i32, x: f32, y: f32, z: f32, rx: f32, ry: f32, rz: f32, sx: f32, sy: f32, sz: f32) -> ();
}

#[no_mangle]
pub extern "C" fn update() -> () {
  unsafe {
    let name = std::ffi::CString::new("Cube").unwrap();
    let object = get_object(name.as_ptr());
    static mut rot: f32 = 0.1;
    rot += 0.01;
    set_transform(object, 0.0, 0.0, 0.0, 0.0, 0.0, rot, 1.0, 1.0, 1.0);
  }
}

#[no_mangle]
pub extern "C" fn main() -> i32 {
  unsafe {
    notify_on_update(update);
  }
  return 0;
}
