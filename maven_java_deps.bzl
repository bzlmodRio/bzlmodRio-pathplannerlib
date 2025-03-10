load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_pathplannerlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_pathplanner_lib_pathplannerlib_java",
        artifact = "com.pathplanner.lib:PathplannerLib-java:2025.2.6",
        artifact_sha256 = "ac1a6d5d14d33e97cc4a273a93a2acb4c6715ae283893d755eed11b9f9fb4dc7",
        server_urls = ["https://3015rangerrobotics.github.io/pathplannerlib/repo"],
    )

def setup_legacy_bzlmodrio_pathplannerlib_java_dependencies():
    __setup_bzlmodrio_pathplannerlib_java_dependencies(None)

setup_bzlmodrio_pathplannerlib_java_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_java_dependencies,
)
