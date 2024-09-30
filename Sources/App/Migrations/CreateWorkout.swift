import Fluent

struct CreateWorkout: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("workouts")
            .id()
            .field("title", .string, .required)
            .field("distance", .int, .required)
            .field("swimset_ids", .array(of: .uuid), .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("workouts").delete()
    }
}
