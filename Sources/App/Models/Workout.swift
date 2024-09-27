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

    // @Children(for: \.$workout)
    // var sets: [Set]


    init() { }

    // init(id: UUID? = nil, title: String, distance: Int = 0, sets: [Set] = []) {
    init(id: UUID? = nil, title: String, distance: Int) {
        self.id = id
        self.title = title
        self.distance = distance
        // self.sets = []
    }
    
    func toDTO() -> WorkoutDTO {
        .init(
            id: self.id,
            title: self.$title.value,
            distance: self.$distance.value
        )
    }
}
