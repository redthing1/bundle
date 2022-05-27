import std.stdio;
import std.conv;
import std.array;
import std.range;
import std.string;

import bundle;

void main() {
	// 23 mb dataset
	auto original = "There's a lady who's sure all that glitters is gold";
	for (auto i = 0; i < 18; ++i)
		original ~= original ~ to!string(i + 1).replicate(32 + i);

	// pack, unpack & verify all encoders
	auto libs = [
		RAW, SHOCO, LZ4F, MINIZ, LZIP, LZMA20,
		ZPAQ, LZ4, BROTLI9, ZSTD, LZMA25,
		BSC, BROTLI11, SHRINKER, CSC20, BCM,
		ZLING, MCM, TANGELO, ZMOLLY, CRUSH, LZJB
	];
	foreach (lib; libs) {
		auto packed = pack!(char[])(lib, original.to!(char[]));
		auto unpacked = unpack(packed);
		writefln("%s -> %s bytes (%s)", original.length, packed.length, name_of(lib));
		assert(original == unpacked);
	}

	writefln("All ok.");
}
