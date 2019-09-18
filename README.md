# vperlin
V module to calculate Perlin noise (https://en.wikipedia.org/wiki/Perlin_noise).

This module is a V port based on http://riven8192.blogspot.com/2010/08/calculate-perlinnoise-twice-as-fast.html .

# Development setup for contribution:
1. Fork this repository (<https://github.com/spytheman/vperlin/fork>)
2. Clone your forked repository to ~/.vmodules/spytheman/vperlin:
```
mkdir -p ~/.vmodules/spytheman/ && cd ~/.vmodules/spytheman/ && rm -rf vperlin/ 
git clone https://github.com/YOU/vperlin vperlin/
cd vperlin/
```
3. Create your new feature/bugfix branch (`git checkout -b my-new-feature`)
4. Make your changes and then run `make test`
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request from github's web interface at <https://github.com/spytheman/vperlin>

## License
[MIT](LICENSE)

## Contributors

- [Delian Angelov](https://github.com/spytheman) - creator and maintainer
