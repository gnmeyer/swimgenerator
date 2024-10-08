import Fluent

struct CreateSwimSet: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("swimsets")
            .id()
            .field("title", .string, .required)
            .field("distance", .int, .required)
            .field("rest", .int, .required)
            .field("reps", .int, .required)
            .field("stroke_ids", .array(of: .uuid), .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("swimsets").delete()
    }
}
