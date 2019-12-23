module stb

[inline] pub fn              noise3(x f32, y f32, z f32, x_wrap int, y_wrap int, z_wrap int) f32 {	return C.stb_perlin_noise3( x, y, z, x_wrap, y_wrap, z_wrap ) }
[inline] pub fn        ridge_noise3(x f32, y f32, z f32, lacunarity f32, gain f32, offset f32, octaves int) f32 { return C.stb_perlin_ridge_noise3(x, y, z, lacunarity, gain, offset, octaves) }
[inline] pub fn          fbm_noise3(x f32, y f32, z f32, lacunarity f32, gain f32, octaves int) f32 { return C.stb_perlin_fbm_noise3(x, y, z, lacunarity, gain, octaves) }
[inline] pub fn   turbulence_noise3(x f32, y f32, z f32, lacunarity f32, gain f32, octaves int) f32 { return C.stb_perlin_turbulence_noise3(x, y, z, lacunarity, gain, octaves) }
[inline] pub fn noise3_wrap_nonpow2(x f32, y f32, z f32, x_wrap int, y_wrap int, z_wrap int, seed byte) f32 { return C.stb_perlin_noise3_wrap_nonpow2(x, y, z, x_wrap, y_wrap, z_wrap, seed) }
