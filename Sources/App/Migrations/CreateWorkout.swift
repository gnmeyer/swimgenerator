import Fluent

struct CreateWorkout: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("workouts")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("workouts").delete()
    }
}
