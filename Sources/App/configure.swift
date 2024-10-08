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
         username: Environment.get("DATABASE_USERNAME") ?? "postgres",
         password: Environment.get("DATABASE_PASSWORD") ?? "",
         database: Environment.get("DATABASE_NAME") ?? "swimgenerator",
         tls: .prefer(try .init(configuration: .clientDefault)))
     ), as: .psql)

//    app.database.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "swimgenerator"), as: .psql)

//    app.migrations.add(CreateTodo())
// app.migrations.add(CreateSet())
    
    app.migrations.add(CreateWorkout())
    app.migrations.add(CreateSwimSet())
    app.migrations.add(CreateStroke())
    app.migrations.add(CreateWorkoutSwimSetPivot())

    app.views.use(.leaf)


    // register routes
    try routes(app)

}
