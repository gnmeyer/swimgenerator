import Fluent
import Foundation
import Vapor

final class Workout: Model, Content, @unchecked Sendable {

    static let schema = "workouts" //table name

    @ID(key: .id)
    var id: UUID? // primary key

    @Field(key: "title")
    var title: String

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
    
    func toDTO() -> WorkoutDTO {
        .init(
            id: self.id,
            title: self.$title.value
        )
    }

}
