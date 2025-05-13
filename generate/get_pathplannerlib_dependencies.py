import os

from bazelrio_gentool.deps.dependency_container import ModuleDependency
from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies


def get_pathplannerlib_dependencies(
    use_local_allwpilib=False,
    use_local_opencv=False,
    use_local_ni=True,
    allwpilib_version_override="2025.3.2.bcr1",
    opencv_version_override="2025.4.10.0-3.bcr2",
    ni_version_override="2025.2.0.bcr1",
):
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv,
            use_local_ni=use_local_ni,
            opencv_version_override=opencv_version_override,
            ni_version_override=ni_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version=allwpilib_version_override,
    )

    group = vendordep_dependency(
        "bzlmodrio-pathplannerlib",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        fail_on_hash_miss=False,
        has_static_libraries=False,
        install_name_lookup={
            "PathplannerLib-cpp": dict(
                artifact_install_name="PathplannerLib",
                deps=[
                    allwpilib_dependency.container.get_cc_dependency("wpilibc-cpp"),
                    allwpilib_dependency.container.get_cc_dependency(
                        "wpilibNewCommands-cpp"
                    ),
                ],
            ),
        },
    )
    group.add_module_dependency(allwpilib_dependency)

    group.add_cc_meta_dependency(
        "pathplannerlib-cpp",
        deps=[
            "PathplannerLib-cpp",
            "wpilibNewCommands-cpp",
            "wpilibc-cpp",
        ],
        platform_deps={},
        jni_deps={
            # TODO
        },
    )

    group.add_java_meta_dependency(
        "pathplannerlib-java",
        group_id=f"com.pathplanner.lib",
        deps=[
            "wpilibj-java",
        ],
    )

    return group
