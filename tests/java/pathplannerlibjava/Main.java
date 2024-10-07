package pathplannerlibjava;

import com.pathplanner.lib.path.GoalEndState;
import com.pathplanner.lib.path.PathConstraints;
import com.pathplanner.lib.path.PathPlannerPath;
import com.pathplanner.lib.path.Waypoint;
import edu.wpi.first.math.geometry.Pose2d;
import edu.wpi.first.math.geometry.Rotation2d;
import java.util.List;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    List<Waypoint> bezierPoints =
        PathPlannerPath.waypointsFromPoses(
            new Pose2d(1.0, 1.0, Rotation2d.fromDegrees(0)),
            new Pose2d(3.0, 1.0, Rotation2d.fromDegrees(0)),
            new Pose2d(5.0, 3.0, Rotation2d.fromDegrees(90)));

    PathPlannerPath path =
        new PathPlannerPath(
            bezierPoints,
            new PathConstraints(3.0, 3.0, 2 * Math.PI, 4 * Math.PI),
            null,
            new GoalEndState(0.0, Rotation2d.fromDegrees(-90)));

    System.out.println(path);
  }
}
