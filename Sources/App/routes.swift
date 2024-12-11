import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }


    try app.register(collection: WorkoutController())
    try app.register(collection: SwimSetController())
    try app.register(collection: StrokeController())


//    app.post("workouts") {req -> EventLoopFuture<Workout> in
//       let workout = try req.content.decode(Workout.self)
//        
//        return workout.create(on: req.db)
//    }
    
//    //localhost:8080/workout POST
//   app.post("workouts") {req -> EventLoopFuture<Workout> in
//       let workout = try req.content.decode(Workout.self)
//       
//       return workout.create(on: req.db).map { workout }
//   }
    


}
