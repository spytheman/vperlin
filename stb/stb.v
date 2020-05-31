module stb

#flag -I @VROOT/stb
#flag linux -mtune=native -march=native
#flag @VROOT/stb/stb_perlin.o
#include "stb_perlin.h"

             fn C.stb_perlin_noise3(x f32, y f32, z f32, x_wrap int, y_wrap int, z_wrap int) f32
       fn C.stb_perlin_ridge_noise3(x f32, y f32, z f32, lacunarity f32, gain f32, offset f32, octaves int) f32
         fn C.stb_perlin_fbm_noise3(x f32, y f32, z f32, lacunarity f32, gain f32, octaves int) f32
  fn C.stb_perlin_turbulence_noise3(x f32, y f32, z f32, lacunarity f32, gain f32, octaves int) f32
fn C.stb_perlin_noise3_wrap_nonpow2(x f32, y f32, z f32, x_wrap int, y_wrap int, z_wrap int, seed byte) f32
