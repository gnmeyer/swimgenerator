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

        //Set up Open Telemetry
        let spanExporter = StdoutExporter();
        let spanProcessor = SimpleSpanProcessor(spanExporter: spanExporter)
        let resources = DefaultResources().get()

        let instrumentationScopeName = "SwimGen Vapor Server"
        let instrumentationScopeVersion = "semver:0.1.0"

        OpenTelemetry.registerTracerProvider(tracerProvider:
            TracerProviderBuilder()
                .add(spanProcessor: spanProcessor)
                .with(resource: resources)
                .build()
        )
    

        let tracer = OpenTelemetry.instance.tracerProvider.get(instrumentationName: "Test Instrument", instrumentationVersion: "1.0")

        let span = tracer.spanBuilder(spanName: "Create Span Test").setSpanKind(spanKind: .internal).startSpan()

        let stroke = try req.content.decode(StrokeDTO.self).toModel()
        
        span.end();

        try await stroke.save(on: req.db)
        return stroke.toDTO()
    }

    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let stroke = try await Stroke.find(req.parameters.get("strokeID"), on: req.db) else {
            throw Abort(.notFound)
        }

        try await stroke.delete(on: req.db)
        return .noContent
    }
}
