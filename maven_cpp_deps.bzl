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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-headers.zip",
        sha256 = "645ded6016d254cb8c1afedc20a66b98ab067f1c6ce21dae3a76b53bb2b4ea59",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_windowsx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-windowsx86-64.zip",
        sha256 = "3f8ba47fe0180209f4e6f978075aa81b9bc5d8ec46695e50df1e7adba84e3ebf",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_osxuniversal",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-osxuniversal.zip",
        sha256 = "541903aad9342f3657eb16d2b187bbd7132b4ab1e5d557bb279d017a83fea0a2",
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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-linuxx86-64.zip",
        sha256 = "96a8d10ad6f49346ec84251e737aba950789812353b62cfa5198919a8ed0296b",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxathena",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-linuxathena.zip",
        sha256 = "9104a6f20cbc795ffed80b88e9509bbba979697ae44c0447238ef13fb3518ea0",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm32",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-linuxarm32.zip",
        sha256 = "3def2ad358ac8667caf8e530c436318024a58adf405f5b52c869abd28a122462",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-6/PathplannerLib-cpp-2025.0.0-beta-6-linuxarm64.zip",
        sha256 = "cfeab201e702cfddac5b14f1baecd57bb22bff8353468d18df4503a0855dce8a",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_pathplannerlib_cpp_dependencies():
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies(None)

setup_bzlmodrio_pathplannerlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies,
)
