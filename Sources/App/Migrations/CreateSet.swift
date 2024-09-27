import Fluent

struct CreateSet: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("sets")
            .id()
            .field("title", .string, .required)
            .field("distance", .int, .required)
            .field("rest", .int, .required)
            .field("reps", .int, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("strokes").delete()
    }
}
