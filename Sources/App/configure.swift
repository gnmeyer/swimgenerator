import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

     app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        //  hostname: "0.tcp.us-cal-1.ngrok.io",
        //  port: 10557,
         username: Environment.get("DATABASE_USERNAME") ?? "postgres",
         password: Environment.get("DATABASE_PASSWORD") ?? "",
         database: Environment.get("DATABASE_NAME") ?? "swimgenerator",
         tls: .prefer(try .init(configuration: .clientDefault)))
     ), as: .psql)

    app.migrations.add(CreateWorkout())
    app.migrations.add(CreateSwimSet())
    app.migrations.add(CreateStroke())
    app.migrations.add(CreateWorkoutSwimSetPivot())

    app.views.use(.leaf)


    // register routes
    try routes(app)

}
