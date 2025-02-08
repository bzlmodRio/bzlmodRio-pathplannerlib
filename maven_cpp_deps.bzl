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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-headers.zip",
        sha256 = "eaf92ba03a4a52618b41cac9cfb860b7e52260000a15abc5b6906b9f11cc6e60",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_windowsx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-windowsx86-64.zip",
        sha256 = "799449855af2390d76d7985dcc35d735e8b88a219ff4095119e5af3c88a06cb3",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxx86-64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-linuxx86-64.zip",
        sha256 = "7e48d70652df57bd537102cdd31300f40fd2793e94afbc835e7295b4b035c9b5",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_osxuniversal",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-osxuniversal.zip",
        sha256 = "20e1717d01f9081e696a514fe23ab5945e7554cca5b8418097637980cbd6fe6e",
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
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-linuxathena.zip",
        sha256 = "1d5f75016695cfae1ce8b98d104c0de78e3a4d7ee825e50b9d5bbce3bd0ce75a",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm32",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-linuxarm32.zip",
        sha256 = "2180510f070f3f1f21d2bd4e5fb0579ad726c70d775ee275b045c113f0a90943",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_pathplanner_lib_pathplannerlib-cpp_linuxarm64",
        url = "https://3015rangerrobotics.github.io/pathplannerlib/repo/com/pathplanner/lib/PathplannerLib-cpp/2025.2.3/PathplannerLib-cpp-2025.2.3-linuxarm64.zip",
        sha256 = "e0f775cc1c3f4d65a7b2a276660a3c0ddab9fd736ad9c8ba14bf293365c20893",
        build_file = "@bzlmodrio-pathplannerlib//private/cpp/PathplannerLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_pathplannerlib_cpp_dependencies():
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies(None)

setup_bzlmodrio_pathplannerlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_cpp_dependencies,
)
