@testable import App
import XCTVapor
import Fluent

final class AppTests: XCTestCase {
    var app: Application!
    
    override func setUp() async throws {
        self.app = try await Application.make(.testing)
        try await configure(app)
        try await app.autoMigrate()
        
    }
    
    override func tearDown() async throws { 
        try await app.autoRevert()
        try await self.app.asyncShutdown()
        self.app = nil
    }
    
/*    func testHelloWorld() async throws {
        try await self.app.test(.GET, "hello", afterResponse: { res async in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }*/
    
    func testPostSwimStroke() async throws {
        try await self.app.test(.GET, "strokes", afterResponse: { res async in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
}


