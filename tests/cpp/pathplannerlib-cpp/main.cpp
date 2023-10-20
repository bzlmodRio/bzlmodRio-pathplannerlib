
#include <pathplanner/lib/PathPlanner.h>
#include <pathplanner/lib/PathPlannerTrajectory.h>
#include <pathplanner/lib/PathPoint.h>

#include <iostream>

using namespace pathplanner;

int main() {
  // Simple path without holonomic rotation. Stationary start/end. Max velocity
  // of 4 m/s and max accel of 3 m/s^2
  PathPlannerTrajectory traj1 = PathPlanner::generatePath(
      PathConstraints(4_mps, 3_mps_sq),
      PathPoint(frc::Translation2d(1_m, 1_m),
                frc::Rotation2d(0_deg)), // position, heading
      PathPoint(frc::Translation2d(3_m, 3_m),
                frc::Rotation2d(45_deg)) // position, heading
  );

  std::cout << traj1.getStates().size() << std::endl;
}
