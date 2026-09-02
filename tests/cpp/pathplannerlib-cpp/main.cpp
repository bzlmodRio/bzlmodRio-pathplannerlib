
#include <pathplanner/lib/path/PathPlannerPath.h>
#include <pathplanner/lib/trajectory/PathPlannerTrajectory.h>

#include <cmath>
#include <iostream>
#include <memory>
#include <vector>

int main() {
  using namespace pathplanner;

  std::vector<wpi::math::Pose2d> poses{
      wpi::math::Pose2d(1.0_m, 1.0_m, wpi::math::Rotation2d(0_deg)),
      wpi::math::Pose2d(3.0_m, 1.0_m, wpi::math::Rotation2d(0_deg)),
      wpi::math::Pose2d(5.0_m, 3.0_m, wpi::math::Rotation2d(90_deg))};
  std::vector<pathplanner::Waypoint> bezierPoints =
      PathPlannerPath::waypointsFromPoses(poses);

  auto path = std::make_shared<PathPlannerPath>(
      bezierPoints,
      PathConstraints(3.0_mps, 3.0_mps_sq, 360_deg_per_s, 720_deg_per_s_sq),
      std::nullopt, GoalEndState(0.0_mps, wpi::math::Rotation2d(-90_deg)));
}
