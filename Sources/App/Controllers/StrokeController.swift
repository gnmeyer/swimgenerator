import Fluent
import Vapor
import OpenTelemetryApi
import OpenTelemetrySdk
import StdoutExporter
import ResourceExtension

struct StrokeController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        let strokes = routes.grouped("strokes")

        strokes.get(use: self.index)
        strokes.post(use: self.create)
        strokes.group(":strokeID") { stroke in
            stroke.delete(use: self.delete)
        }
    }

    @Sendable
    func index(req: Request) async throws -> [StrokeDTO] {
        try await Stroke.query(on: req.db).all().map { $0.toDTO() }
    }

    @Sendable
    func create(req: Request) async throws -> StrokeDTO {
        let tracer = await TraceManager.shared.tracer

        //Set up Open Telemetry
        let createStrokeSpan = tracer.spanBuilder(spanName: "/createSwimStroke").setSpanKind(spanKind: .client).startSpan()

        let stroke = try req.content.decode(StrokeDTO.self).toModel(createStrokeSpan: createStrokeSpan)

        try await stroke.save(on: req.db)
        createStrokeSpan.end()
        return stroke.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        let tracer = await TraceManager.shared.tracer

        let deleteStrokeSpan = tracer.spanBuilder(spanName: "/deleteSwimStroke").setSpanKind(spanKind: .client).startSpan()

        guard let stroke = try await Stroke.find(req.parameters.get("strokeID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await stroke.delete(on: req.db)

        deleteStrokeSpan.end()

        return .noContent
    }
}
