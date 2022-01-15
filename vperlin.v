module vperlin

// Initially ported from:
// http://riven8192.blogspot.com/2010/08/calculate-perlinnoise-twice-as-fast.html
//
// See also the original Perlin's code from:
// https://mrl.nyu.edu/~perlin/noise/
// http://mrl.nyu.edu/~perlin/paper445.pdf

pub const (
	perm = [
		151,
		160,
		137,
		91,
		90,
		15,
		131,
		13,
		201,
		95,
		96,
		53,
		194,
		233,
		7,
		225,
		140,
		36,
		103,
		30,
		69,
		142,
		8,
		99,
		37,
		240,
		21,
		10,
		23,
		190,
		6,
		148,
		247,
		120,
		234,
		75,
		0,
		26,
		197,
		62,
		94,
		252,
		219,
		203,
		117,
		35,
		11,
		32,
		57,
		177,
		33,
		88,
		237,
		149,
		56,
		87,
		174,
		20,
		125,
		136,
		171,
		168,
		68,
		175,
		74,
		165,
		71,
		134,
		139,
		48,
		27,
		166,
		77,
		146,
		158,
		231,
		83,
		111,
		229,
		122,
		60,
		211,
		133,
		230,
		220,
		105,
		92,
		41,
		55,
		46,
		245,
		40,
		244,
		102,
		143,
		54,
		65,
		25,
		63,
		161,
		1,
		216,
		80,
		73,
		209,
		76,
		132,
		187,
		208,
		89,
		18,
		169,
		200,
		196,
		135,
		130,
		116,
		188,
		159,
		86,
		164,
		100,
		109,
		198,
		173,
		186,
		3,
		64,
		52,
		217,
		226,
		250,
		124,
		123,
		5,
		202,
		38,
		147,
		118,
		126,
		255,
		82,
		85,
		212,
		207,
		206,
		59,
		227,
		47,
		16,
		58,
		17,
		182,
		189,
		28,
		42,
		223,
		183,
		170,
		213,
		119,
		248,
		152,
		2,
		44,
		154,
		163,
		70,
		221,
		153,
		101,
		155,
		167,
		43,
		172,
		9,
		129,
		22,
		39,
		253,
		19,
		98,
		108,
		110,
		79,
		113,
		224,
		232,
		178,
		185,
		112,
		104,
		218,
		246,
		97,
		228,
		251,
		34,
		242,
		193,
		238,
		210,
		144,
		12,
		191,
		179,
		162,
		241,
		81,
		51,
		145,
		235,
		249,
		14,
		239,
		107,
		49,
		192,
		214,
		31,
		181,
		199,
		106,
		157,
		184,
		84,
		204,
		176,
		115,
		121,
		50,
		45,
		127,
		4,
		150,
		254,
		138,
		236,
		205,
		93,
		222,
		114,
		67,
		29,
		24,
		72,
		243,
		141,
		128,
		195,
		78,
		66,
		215,
		61,
		156,
		180,
		////////////////////////////////////////////////////////////////////////////////////
		151,
		160,
		137,
		91,
		90,
		15,
		131,
		13,
		201,
		95,
		96,
		53,
		194,
		233,
		7,
		225,
		140,
		36,
		103,
		30,
		69,
		142,
		8,
		99,
		37,
		240,
		21,
		10,
		23,
		190,
		6,
		148,
		247,
		120,
		234,
		75,
		0,
		26,
		197,
		62,
		94,
		252,
		219,
		203,
		117,
		35,
		11,
		32,
		57,
		177,
		33,
		88,
		237,
		149,
		56,
		87,
		174,
		20,
		125,
		136,
		171,
		168,
		68,
		175,
		74,
		165,
		71,
		134,
		139,
		48,
		27,
		166,
		77,
		146,
		158,
		231,
		83,
		111,
		229,
		122,
		60,
		211,
		133,
		230,
		220,
		105,
		92,
		41,
		55,
		46,
		245,
		40,
		244,
		102,
		143,
		54,
		65,
		25,
		63,
		161,
		1,
		216,
		80,
		73,
		209,
		76,
		132,
		187,
		208,
		89,
		18,
		169,
		200,
		196,
		135,
		130,
		116,
		188,
		159,
		86,
		164,
		100,
		109,
		198,
		173,
		186,
		3,
		64,
		52,
		217,
		226,
		250,
		124,
		123,
		5,
		202,
		38,
		147,
		118,
		126,
		255,
		82,
		85,
		212,
		207,
		206,
		59,
		227,
		47,
		16,
		58,
		17,
		182,
		189,
		28,
		42,
		223,
		183,
		170,
		213,
		119,
		248,
		152,
		2,
		44,
		154,
		163,
		70,
		221,
		153,
		101,
		155,
		167,
		43,
		172,
		9,
		129,
		22,
		39,
		253,
		19,
		98,
		108,
		110,
		79,
		113,
		224,
		232,
		178,
		185,
		112,
		104,
		218,
		246,
		97,
		228,
		251,
		34,
		242,
		193,
		238,
		210,
		144,
		12,
		191,
		179,
		162,
		241,
		81,
		51,
		145,
		235,
		249,
		14,
		239,
		107,
		49,
		192,
		214,
		31,
		181,
		199,
		106,
		157,
		184,
		84,
		204,
		176,
		115,
		121,
		50,
		45,
		127,
		4,
		150,
		254,
		138,
		236,
		205,
		93,
		222,
		114,
		67,
		29,
		24,
		72,
		243,
		141,
		128,
		195,
		78,
		66,
		215,
		61,
		156,
		180,
	]
)

[inline]
pub fn fade(t f64) f64 {
	return t * t * t * (t * (t * 6.0 - 15.0) + 10.0)
}

[inline]
pub fn lerp(t f64, a f64, b f64) f64 {
	return a + t * (b - a)
}

///////////////////////////////////////////////////////////////////////////////////////
// 2D Perlin noise, see https://mrl.nyu.edu/~perlin/noise/ImprovedNoise2D.java
[inline]
pub fn grad2d(hash int, x f64, y f64) f64 {
	// h := hash & 0xF
	// u := if h<8 { x } else { y }
	// v := if h<4 { y } else { if (h==12||h==14) { x } else { 0 } }
	// return ( if (h&1) == 0 { u } else {-u } ) + ( if (h&2) == 0  { v } else { -v } )
	match hash & 0xF {
		0x0 { return x + y }
		0x1 { return -x + y }
		0x2 { return x - y }
		0x3 { return -x - y }
		0x4 { return x }
		0x5 { return -x }
		0x6 { return x }
		0x7 { return -x }
		0x8 { return y }
		0x9 { return -y }
		0xA { return y }
		0xB { return -y }
		0xC { return y + x }
		0xD { return -y }
		0xE { return y - x }
		0xF { return -y }
		else { return 0 }
	}
}

[inline]
pub fn noise2d(xx f64, yy f64) f64 {
	ix := int(xx)
	gx := ix & 0xFF
	iy := int(yy)
	gy := iy & 0xFF
	x := xx - ix
	y := yy - iy
	u := fade(x)
	v := fade(y)
	a := vperlin.perm[gx] + gy
	aa := vperlin.perm[a]
	ab := vperlin.perm[a + 1]
	b := vperlin.perm[gx + 1] + gy
	ba := vperlin.perm[b]
	bb := vperlin.perm[b + 1]
	return lerp(v, lerp(u, grad2d(vperlin.perm[aa], x, y), grad2d(vperlin.perm[ba], x - 1,
		y)), lerp(u, grad2d(vperlin.perm[ab], x, y - 1), grad2d(vperlin.perm[bb], x - 1,
		y - 1)))
}

///////////////////////////////////////////////////////////////////////////////////////

[inline]
pub fn grad3d(hash int, x f64, y f64, z f64) f64 {
	// f64 u = (h < 8) ? x : y
	// f64 v = (h < 4) ? y : ((h == 12 || h == 14) ? x : z)
	// return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v)
	match hash & 0xF {
		0x0 { return x + y }
		0x1 { return -x + y }
		0x2 { return x - y }
		0x3 { return -x - y }
		0x4 { return x + x }
		0x5 { return -x + x }
		0x6 { return x - x }
		0x7 { return -x - x }
		0x8 { return y + x }
		0x9 { return -y + x }
		0xA { return y - x }
		0xB { return -y - x }
		0xC { return y + z }
		0xD { return -y + x }
		0xE { return y - x }
		0xF { return -y - z }
		else { return 0 } // never happens
	}
}

[inline]
pub fn noise3d(xx f64, yy f64, zz f64) f64 {
	mut x := xx
	mut y := yy
	mut z := zz

	ix := int(x)
	x -= ix
	iy := int(y)
	y -= iy
	iz := int(z)
	z -= iz

	u := fade(x)
	v := fade(y)
	w := fade(z) // fade curves

	gx := ix & 0xFF
	gy := iy & 0xFF
	gz := iz & 0xFF

	// gx gy gz -> unit cube containing the xx yy zz point
	// x y z -> relative coords *inside* the unit cube

	// compute hash coordinates of the 8 cube corners
	a0 := gy + vperlin.perm[gx]
	b0 := gy + vperlin.perm[gx + 1]
	aa := gz + vperlin.perm[a0]
	ab := gz + vperlin.perm[a0 + 1]
	ba := gz + vperlin.perm[b0]
	bb := gz + vperlin.perm[b0 + 1]

	aa0 := vperlin.perm[aa]
	aa1 := vperlin.perm[aa + 1]
	ab0 := vperlin.perm[ab]
	ab1 := vperlin.perm[ab + 1]
	ba0 := vperlin.perm[ba]
	ba1 := vperlin.perm[ba + 1]
	bb0 := vperlin.perm[bb]
	bb1 := vperlin.perm[bb + 1]

	a1 := grad3d(bb1, x - 1, y - 1, z - 1)
	a2 := grad3d(ab1, x, y - 1, z - 1)
	a3 := grad3d(ba1, x - 1, y, z - 1)
	a4 := grad3d(aa1, x, y, z - 1)
	a5 := grad3d(bb0, x - 1, y - 1, z)
	a6 := grad3d(ab0, x, y - 1, z)
	a7 := grad3d(ba0, x - 1, y, z)
	a8 := grad3d(aa0, x, y, z)

	// return the blended results from the 8 corners of the cube
	a8_5 := lerp(v, lerp(u, a8, a7), lerp(u, a6, a5))
	a4_1 := lerp(v, lerp(u, a4, a3), lerp(u, a2, a1))
	return lerp(w, a8_5, a4_1)
}

////////////////////////////////////////////////////////////////////////////
// Port of the 4D variant of the Perlin noise, see
// https://mrl.nyu.edu/~perlin/noise/ImprovedNoise4D.java
[inline]
pub fn grad4d(hash int, x f64, y f64, z f64, w f64) f64 {
	h := hash & 31 // CONVERT LO 5 BITS OF HASH TO 32 GRAD DIRECTIONS.
	mut a := y
	mut b := z
	mut c := w // X,Y,Z
	match h >> 3 {
		// OR, DEPENDING ON HIGH ORDER 2 BITS:
		1 {
			a = w
			b = x
			c = y
		} // W,X,Y
		2 {
			a = z
			b = w
			c = x
		} // Z,W,X
		3 {
			a = y
			b = z
			c = w
		} // Y,Z,W
		else {}
	}
	aa := if 0 == h & 4 { -a } else { a }
	bb := if 0 == h & 2 { -b } else { b }
	cc := if 0 == h & 1 { -c } else { c }
	return aa + bb + cc
}

[inline]
pub fn noise4d(xx f64, yy f64, zz f64, ww f64) f64 {
	ix := int(xx)
	x := xx - ix
	gx := ix & 0xFF
	iy := int(yy)
	y := yy - iy
	gy := iy & 0xFF
	iz := int(zz)
	z := zz - iz
	gz := iz & 0xFF
	iw := int(ww)
	w := ww - iw
	gw := iw & 0xFF
	a := fade(x)
	b := fade(y)
	c := fade(z)
	d := fade(w)
	za := vperlin.perm[gx] + gy
	zaa := vperlin.perm[za] + gz
	zab := vperlin.perm[za + 1] + gz
	zb := vperlin.perm[gx + 1] + gy
	zba := vperlin.perm[zb] + gz
	zbb := vperlin.perm[zb + 1] + gz
	zaaa := vperlin.perm[zaa] + gw
	zaab := vperlin.perm[zaa + 1] + gw
	zaba := vperlin.perm[zab] + gw
	zabb := vperlin.perm[zab + 1] + gw
	zbaa := vperlin.perm[zba] + gw
	zbab := vperlin.perm[zba + 1] + gw
	zbba := vperlin.perm[zbb] + gw
	zbbb := vperlin.perm[zbb + 1] + gw
	return lerp(d, lerp(c, lerp(b, lerp(a, grad4d(vperlin.perm[zaaa], x, y, z, w), grad4d(vperlin.perm[zbaa],
		x - 1, y, z, w)), lerp(a, grad4d(vperlin.perm[zaba], x, y - 1, z, w), grad4d(vperlin.perm[zbba],
		x - 1, y - 1, z, w))), lerp(b, lerp(a, grad4d(vperlin.perm[zaab], x, y, z - 1,
		w), grad4d(vperlin.perm[zbab], x - 1, y, z - 1, w)), lerp(a, grad4d(vperlin.perm[zabb],
		x, y - 1, z - 1, w), grad4d(vperlin.perm[zbbb], x - 1, y - 1, z - 1, w)))), lerp(c,
		lerp(b, lerp(a, grad4d(vperlin.perm[zaaa + 1], x, y, z, w - 1), grad4d(vperlin.perm[zbaa + 1],
		x - 1, y, z, w - 1)), lerp(a, grad4d(vperlin.perm[zaba + 1], x, y - 1, z, w - 1),
		grad4d(vperlin.perm[zbba + 1], x - 1, y - 1, z, w - 1))), lerp(b, lerp(a, grad4d(vperlin.perm[
		zaab + 1], x, y, z - 1, w - 1), grad4d(vperlin.perm[zbab + 1], x - 1, y, z - 1,
		w - 1)), lerp(a, grad4d(vperlin.perm[zabb + 1], x, y - 1, z - 1, w - 1), grad4d(vperlin.perm[
		zbbb + 1], x - 1, y - 1, z - 1, w - 1)))))
}

// support noise/3 is for compatibility
[inline]
pub fn noise(xx f64, yy f64, zz f64) f64 {
	return noise3d(xx, yy, zz)
}
