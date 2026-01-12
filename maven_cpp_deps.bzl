load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_pathplannerlib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_headers",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-headers.zip",
        sha256 = "923a1b41a8476f6c80bdbd41f3431bcb29df4c18354014292f38cf0eaf45c894",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_windowsx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-windowsx86-64.zip",
        sha256 = "837aad2e8e903a300004812b8f714ca79c69a5dd43618c4cdab5b19bf9f6f3d0",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-linuxx86-64.zip",
        sha256 = "60083010399361f7955276b3b2dede3391d44bcb5c8c01064c67241e1a9e7bdc",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_osxuniversal",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-osxuniversal.zip",
        sha256 = "128d1c10a801f143f8bca5b9cc45ff7bf76d1f503af8b2cf8f3821859dd7e212",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libPathplannerLib.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libwpilibNewCommands.dylib @rpath/libwpilibNewCommands.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libPathplannerLib.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libPathplannerLib.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxathena",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-linuxathena.zip",
        sha256 = "bc9b37950ae790f9230d53359ccf3a0dfede094c2d1e324173dcb78712029fef",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm32",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-linuxarm32.zip",
        sha256 = "7a2484dec7bac5574cb41a0301087caf2af7e9c74f570d35fc920cb468085fff",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2026.1.2/PathplannerLib-cpp-2026.1.2-linuxarm64.zip",
        sha256 = "4d42d0eb46f6310c0bb2891f0d32044d2b5e2ffe47f19139526d2512c4b17651",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_pathplannerlib_cpp_dependencies():
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies(None)

setup_bzlmodrio_pathplannerlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies,
)
