import Fluent
import struct Foundation.UUID

final class SwimSet: Model, @unchecked Sendable {
    static let schema = "swimsets"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "distance")
    var distance: Int

    @Field(key: "rest")
    var rest: Int
    
    @Field(key: "reps")
    var reps: Int
    
    // @Children(for: \.$set)
    // var strokes: [Stroke]

    // @Parent(key: "workout_id")
    // var workout: Workout
    
    //    @Field(key: "intensity")
    //    var intensity: Int


    init() { }

    // init(id: UUID? = nil, title: String, distance: Int, rest: Int, reps: Int, strokes: [Stroke], workout_id: UUID) {
    init(id: UUID? = nil, title: String, distance: Int, rest: Int, reps: Int) {
        self.id = id
        self.title = title
        self.distance = distance
        self.rest = rest
        self.reps = reps
        // self.strokes = strokes
        // self.workout_id = workout_id
    }
    
    func toDTO() -> SwimSetDTO {
        .init(
            id: self.id,
            title: self.$title.value,
            distance: self.$distance.value,
            rest: self.$rest.value,
            reps: self.$reps.value
            // strokes = self.$strokes.value
            // workout_id: self.$workout.id
        )
    }
}
