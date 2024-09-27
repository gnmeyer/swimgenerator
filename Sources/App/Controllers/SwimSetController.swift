import Fluent
import Vapor

struct SwimSetController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let swimsets = routes.grouped("swimsets")

        swimsets.get(use: self.index)
        swimsets.post(use: self.create)
        swimsets.group(":swimsetID") { swimset in
            swimset.delete(use: self.delete)
        }
    }

    @Sendable
    func index(req: Request) async throws -> [SwimSetDTO] {
        try await SwimSet.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> SwimSetDTO {
        let swimset = try req.content.decode(SwimSetDTO.self).toModel()

        try await swimset.save(on: req.db)
        return swimset.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let swimset = try await Workout.find(req.parameters.get("swimsetID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await swimset.delete(on: req.db)
        return .noContent
    }
}
