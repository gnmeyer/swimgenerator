// //
// //  TraceManager.swift
// //  swimgeneratorUI
// //
// //  Created by Grant Meyer on 11/10/24.
// //

// import Foundation
// import OpenTelemetryApi
// import OpenTelemetrySdk

// @MainActor // so we run on the "main actor" and not threaded
// class MetricManager {
//     static let meter = MetricManager()
    
//     private init() {
        
//         let configuration = ClientConnection.Configuration.default(
//         target: .hostAndPort("localhost", 4317),
//         eventLoopGroup: MultiThreadedEventLoopGroup(numberOfThreads: 1)
//         )
//         let client = ClientConnection(configuration: configuration)
        
//         let resource = Resource.init(attributes: ["service.name": "StableMetricExample"]).merge(other: resource())
        
//         OpenTelemetry.registerMeterProvider(meterProvider: StableMeterProviderSdk.builder().registerMetricReader(reader: StablePeriodicMetricReaderBuilder(exporter: StableOtlpMetricExporter(channel: client)).setInterval(timeInterval: 60).build()).build())
//     }
// }
