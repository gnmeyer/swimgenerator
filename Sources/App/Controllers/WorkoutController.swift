import Fluent
import Vapor

struct WorkoutController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let workouts = routes.grouped("workouts")

        workouts.get(use: self.index)
        workouts.post(use: self.create)
        workouts.group(":workoutID") { workout in
        workout.delete(use: self.delete)
        }
    }

    @Sendable
    func index(req: Request) async throws -> [WorkoutDTO] {
        try await Workout.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> WorkoutDTO {
        let workout = try req.content.decode(WorkoutDTO.self).toModel()

        try await workout.save(on: req.db)
        return workout.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let workout = try await Workout.find(req.parameters.get("workoutID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await workout.delete(on: req.db)
        return .noContent
    }
}
