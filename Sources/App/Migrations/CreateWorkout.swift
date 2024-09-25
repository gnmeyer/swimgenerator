import Fluent
import Foundation
import FluentPostgresDriver

struct CreateWorkout: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema("workouts")
            .id()
            .field("title", .string)
            .create()
        }
        
        // undo
        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("workouts").delete()
        }
}
