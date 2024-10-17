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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-headers.zip",
        sha256 = "68e393b21b4e7765cbd07f038a733005bf94e752794ddf85b97b8c324bcf3498",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_windowsx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-windowsx86-64.zip",
        sha256 = "8ea91e2a16a16c0a9e63274b6fe0f2e5fc2dd92ef8bee8e99c9f54662dc9f936",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_osxuniversal",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-osxuniversal.zip",
        sha256 = "9143d85735b1706ce60278fbd5795234f6633f3af56cd7684800a9635131b5c2",
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
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-linuxx86-64.zip",
        sha256 = "95ab3345e1959d7a38b23b2900abd0111da5b29264ab69135f77114edf70ffc5",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxathena",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-linuxathena.zip",
        sha256 = "f7961750463744970a46984c12a470152705a96c7f26768bb2e1ab06873e5859",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm32",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-linuxarm32.zip",
        sha256 = "9b07ae1d6c0b5c42707a7ccce1f084f100997bc22cca21dc0356d1d6084e80da",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-3/PathplannerLib-cpp-2025.0.0-beta-3-linuxarm64.zip",
        sha256 = "613f18a613d77af9190145d21042dc715a6f242c127dc0fdeea5c40840ec68bc",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_pathplannerlib_cpp_dependencies():
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies(None)

setup_bzlmodrio_pathplannerlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies,
)
