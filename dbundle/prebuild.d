module dbundle.prebuild;

import std.stdio;
import std.file;
import std.path;
import std.process;
import std.format;
import std.array : replace, array, join;
import std.algorithm : reduce, map, find;

// dub run --build=release --compiler=dmd --quiet --yes dpp --

void main() {
    // common paths
    const root_dir = dirName(dirName(buildNormalizedPath(__FILE_FULL_PATH__)));
    // package paths
    const source_dir = buildPath(root_dir, "source");

    writefln("source_dir: %s", source_dir);
    auto compiler = environment.get("DC", "dmd");

    auto run_dpp(string args) {
        const dpp_bin = format!"dub run --build=release --compiler=%s --quiet --yes dpp --"(compiler);
        return executeShell(dpp_bin ~ " " ~ args,
            null, Config.none, size_t.max, root_dir);
    }

    // auto ret = run_dpp("--version");
    // writefln("dpp version: %s", ret.output);

    
}
