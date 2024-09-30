import Fluent
import struct Foundation.UUID
// import Set

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Workout: Model, @unchecked Sendable {
    static let schema = "workouts"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "distance")
    var distance: Int

    @Siblings(through: WorkoutSwimSetPivot.self, from: \.$workout, to: \.$swimset)
    var swimsets: [SwimSet]

    @Field(key: "swimset_ids")
    var swimset_ids: [UUID]?

    init() { }

    init(id: UUID? = nil, title: String, distance: Int, swimset_ids: [UUID]? = nil) {
        self.id = id
        self.title = title
        self.distance = distance
        self.swimset_ids = swimset_ids
    }
    
    func toDTO() -> WorkoutDTO {
        .init( 
            id: self.id,
            title: self.$title.value,
            distance: self.$distance.value,
            swimset_ids: self.swimset_ids
        )
    }
}
