load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_pathplannerlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_pathplanner_lib_pathplannerlib_java",
        artifact = "com.pathplanner.lib:PathplannerLib-java:2025.2.4",
        artifact_sha256 = "e08a7733398febc9e8bcf02426f6ec2d420fc2b6b853f692224a5a15bf32fdd8",
        server_urls = ["https://3015rangerrobotics.github.io/pathplannerlib/repo"],
    )

def setup_legacy_bzlmodrio_pathplannerlib_java_dependencies():
    __setup_bzlmodrio_pathplannerlib_java_dependencies(None)

setup_bzlmodrio_pathplannerlib_java_dependencies = module_extension(
    __setup_bzlmodrio_pathplannerlib_java_dependencies,
)
