load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_pathplannerlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_pathplanner_lib_pathplannerlib_java",
        artifact = "com.pathplanner.lib:PathplannerLib-java:2025.0.0-beta-3.1",
        artifact_sha256 = "cc8cc5690642a4196e3a201e4457c70dda6ba9bb7a0f955c8f146bef625e7a6e",
        server_urls = ["https://3015rangerrobotics.github.io/pathplannerlib/repo"],
    )

def setup_legacy_bzlmodrio_pathplannerlib_java_dependencies():
    __setup_bzlmodrio_pathplannerlib_java_dependencies(None)

setup_bzlmodrio_pathplannerlib_java_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_java_dependencies,
)
