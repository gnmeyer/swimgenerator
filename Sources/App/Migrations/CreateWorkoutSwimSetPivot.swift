import Fluent

struct CreateWorkoutSwimSetPivot: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("workout_swimset_pivot")
            .id()
            .field("workout_id", .uuid, .required, .references("workouts", "id", onDelete: .cascade))
            .field("swimset_id", .uuid, .required, .references("swimsets", "id", onDelete: .cascade))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("workout_swimset_pivot").delete()
    }
}
