load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_pathplannerlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_pathplanner_lib_pathplannerlib_java",
        artifact = "com.pathplanner.lib:PathplannerLib-java:2027.0.0-alpha-3",
        artifact_sha256 = "87e76029726d2841eb388d1fa150e7c8f8a8e6d40bb38c19a3ecd93107da6c8e",
        server_urls = ["https://3015rangerrobotics.github.io/pathplannerlib/repo"],
    )

setup_bzlmodrio_pathplannerlib_java_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_java_dependencies,
)
