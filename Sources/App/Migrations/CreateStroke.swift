//
//  CreateStroke.swift
//  Workout
//
//  Created by Grant Meyer on 9/26/24.
//

import Fluent

struct CreateStroke: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("strokes")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("strokes").delete()
    }
}
