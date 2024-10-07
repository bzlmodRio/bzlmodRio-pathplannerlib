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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-1.1/PathplannerLib-cpp-2025.0.0-beta-1.1-headers.zip",
        sha256 = "466af18d225c3c8a8ca5c10ccd0f0de76554bb46c9bf5f8c1faab100b11abfd9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_windowsx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-1.1/PathplannerLib-cpp-2025.0.0-beta-1.1-windowsx86-64.zip",
        sha256 = "ed593f1680497c71b5f9e9d837ed3ab421c096893fb67307b14d88b10865dec7",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-1.1/PathplannerLib-cpp-2025.0.0-beta-1.1-linuxx86-64.zip",
        sha256 = "756fc550f04bcc7ae9a230dafb2c8f78e264cf1597eec6f25cf4704395e205e0",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxathena",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-1.1/PathplannerLib-cpp-2025.0.0-beta-1.1-linuxathena.zip",
        sha256 = "7bc4e4146823298711f9c130f3779949ef77e21a265408192efe76eef4c50555",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm32",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-1.1/PathplannerLib-cpp-2025.0.0-beta-1.1-linuxarm32.zip",
        sha256 = "dd2444d8400c0145050028e14989f350ebfcd1dbed8a773539438f2c539c2d9a",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-1.1/PathplannerLib-cpp-2025.0.0-beta-1.1-linuxarm64.zip",
        sha256 = "b8588762cfef58bf9877365a9ed21b1fb10d35e1607e44a8259f1b4ab07a2d6d",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_pathplannerlib_cpp_dependencies():
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies(None)

setup_bzlmodrio_pathplannerlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies,
)
