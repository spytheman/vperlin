# vperlin

This is a pure V module that calculates [Perlin noise](https://en.wikipedia.org/wiki/Perlin_noise) .

Initially based on http://riven8192.blogspot.com/2010/08/calculate-perlinnoise-twice-as-fast.html .

# Usage:
```shell
v install spytheman.vperlin
```
... then in your v source:
```v
import spytheman.vperlin as perlin

fn main(){
    println( perlin.noise2d( 1.2, 0.1) )
    println( perlin.noise3d( 1.2, 0.1, 0.21 ) )
    println( perlin.noise4d( 1.2, 0.12, 0.13, 0.15) )
}
```

# Development setup for contribution:
1. `v install spytheman.vperlin`
2. `cd ~/.vmodules/spytheman/vperlin`
3. `hub fork`
4. `git checkout -b my_cool_fix`
5. Make your changes, and commit them, as many times, as you like.
7. `hub pull-request`

## License
[MIT](LICENSE)

## Contributors

- [Delian Angelov](https://github.com/spytheman) - creator and maintainer
