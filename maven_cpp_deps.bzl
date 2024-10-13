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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-2.2/PathplannerLib-cpp-2025.0.0-beta-2.2-headers.zip",
        sha256 = "59ada1aa3065f88d08592baddf1ae0b236c2938ca27cd36d7f80f10825f38d58",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_windowsx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-2.2/PathplannerLib-cpp-2025.0.0-beta-2.2-windowsx86-64.zip",
        sha256 = "fb3b4ff385a78b87e6a1bf6f02107c3156e8c5ddd89834b8424aafabde2d64ca",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-2.2/PathplannerLib-cpp-2025.0.0-beta-2.2-linuxx86-64.zip",
        sha256 = "bbb5b6cfb705f9cf903cd0a2dd98c3a294d5b6d05271a7e9f5b94af0039d95ab",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxathena",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-2.2/PathplannerLib-cpp-2025.0.0-beta-2.2-linuxathena.zip",
        sha256 = "f21ef1c1138c662300056f19b4a8b617a459f5a7cb89a4ac848fccf1207b9481",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm32",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-2.2/PathplannerLib-cpp-2025.0.0-beta-2.2-linuxarm32.zip",
        sha256 = "1aa2646bd53dc56a60279c4e21e4c7b8e039873c0fe161e25a6ac2b404456eaf",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.0.0-beta-2.2/PathplannerLib-cpp-2025.0.0-beta-2.2-linuxarm64.zip",
        sha256 = "7b03d97cde84c8c840b75776600236a1aa44f6f999fec15467db945a48f0ddba",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_pathplannerlib_cpp_dependencies():
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies(None)

setup_bzlmodrio_pathplannerlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies,
)
