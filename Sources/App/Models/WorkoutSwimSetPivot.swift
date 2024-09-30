import Fluent
import Vapor

final class WorkoutSwimSetPivot: Model {
    static let schema = "workout_swimset_pivot"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "workout_id")
    var workout: Workout

    @Parent(key: "swimset_id")
    var swimset: SwimSet

    init() { }

    init(workoutID: UUID, swimsetID: UUID) {
        self.$workout.id = workoutID
        self.$swimset.id = swimsetID
    }
}
