import spytheman.vperlin as perlin

fn main(){
	//	println( perlin.perm )
	println( perlin.perm.len )

	println( perlin.noise2d( 1.2, 0.1) )
	println( perlin.noise2d( 1.2, 0.12) )

	println( perlin.noise( 0.0, 0.1, 0.2 ) )
	println( perlin.noise3d( 1.2, 0.1, 0.21 ) )
  
	println( perlin.noise4d( 1.2, 0.12, 0.13, 0.15) )
	println( perlin.noise4d( 1.2, 0.12, 0.13, 0.16) )
}
