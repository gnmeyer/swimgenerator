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

    @Field(key: "stroke_ids")
    var stroke_ids: [UUID]?

    @Siblings(through: WorkoutSwimSetPivot.self, from: \.$swimset, to: \.$workout)
    var workouts: [Workout]
    
    init() { }


    init(id: UUID? = nil, title: String, distance: Int, rest: Int, reps: Int, swimset_ids: [UUID]? = nil) {
        self.id = id
        self.title = title
        self.distance = distance
        self.rest = rest
        self.reps = reps
        self.stroke_ids = swimset_ids
    }
    
    func toDTO() -> SwimSetDTO {
        .init(
            id: self.id,
            title: self.$title.value,
            distance: self.$distance.value,
            rest: self.$rest.value,
            reps: self.$reps.value,
            stroke_ids: self.stroke_ids
        )
    }
}
