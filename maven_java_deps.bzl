load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_pathplannerlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_pathplanner_lib_pathplannerlib_java",
        artifact = "com.pathplanner.lib:PathplannerLib-java:2024.2.5",
        artifact_sha256 = "2ff33569ed55137c14535b7684140935fb85cc6804954d0f71f282fa0037d96e",
        server_urls = ["https://3015rangerrobotics.github.io/pathplannerlib/repo"],
    )

def setup_legacy_bzlmodrio_pathplannerlib_java_dependencies():
    __setup_bzlmodrio_pathplannerlib_java_dependencies(None)

setup_bzlmodrio_pathplannerlib_java_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_java_dependencies,
)
