//
//  StrokeDTO.swift
//  Workout
//
//  Created by Grant Meyer on 9/26/24.
//
import Fluent
import Vapor
import OpenTelemetryApi
import OpenTelemetrySdk
import StdoutExporter
import ResourceExtension

struct StrokeDTO: Content {
    var id: UUID?
    var title: String?

    
    func toModel(createStrokeSpan: Span) -> Stroke {

        let tracer = TraceManager.shared.tracer

        let strokeToModelSpan = tracer.spanBuilder(spanName: ".createStroke.toModel")
        .setParent(createStrokeSpan.context)
        .setSpanKind(spanKind: .client)
        .startSpan()

        let model = Stroke()
        
        model.id = self.id
        if let title = self.title {
            model.title = title
        }

        strokeToModelSpan.end()

        return model
    }
}
