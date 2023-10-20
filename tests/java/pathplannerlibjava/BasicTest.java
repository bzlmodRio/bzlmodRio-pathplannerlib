package pathplannerlibjava;

import static org.junit.jupiter.api.Assertions.assertTrue;

import com.pathplanner.lib.PathConstraints;
import com.pathplanner.lib.PathPlanner;
import com.pathplanner.lib.PathPlannerTrajectory;
import com.pathplanner.lib.PathPoint;
import edu.wpi.first.math.geometry.Rotation2d;
import edu.wpi.first.math.geometry.Translation2d;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    PathPlannerTrajectory traj1 =
        PathPlanner.generatePath(
            new PathConstraints(1, 1),
            false,
            new PathPoint(new Translation2d(0, 0), Rotation2d.fromDegrees(0)),
            new PathPoint(new Translation2d(5, 5), Rotation2d.fromDegrees(90)));
    assertTrue(traj1.getStates().size() > 0);
  }
}
