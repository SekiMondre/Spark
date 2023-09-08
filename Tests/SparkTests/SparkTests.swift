import XCTest
@testable import Spark

extension Double {
    static func random() -> Double {
//        Double.random(in: 0.0...1.0)
        Double.random(in: 0.0...Double.greatestFiniteMagnitude)
    }
}

final class SparkTests: XCTestCase {
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Spark().text, "Hello, World!")
    }
    
    let loops = 1000
    
    func testLerp() {
        for _ in 1...loops {
            let a = Double.random(in: 0.0...Double.greatestFiniteMagnitude)
            let b = Double.random(in: 0.0...Double.greatestFiniteMagnitude)
            let upperBound = max(a, b)
            let lowerBound = min(a, b)
            
            XCTAssert(lerp(from: 0.0, to: 0.0, by: 0.0) == 0.0)
            XCTAssert(lerp(from: lowerBound, to: upperBound, by: 0.0) == lowerBound)
            XCTAssert(lerp(from: lowerBound, to: upperBound, by: 1.0) == upperBound)
            XCTAssert(lerp(from: upperBound, to: lowerBound, by: 0.0) == upperBound)
            XCTAssert(lerp(from: upperBound, to: lowerBound, by: 1.0) == lowerBound)
            
//            XCTAssert(lerpImprecise(from: lowerBound, to: upperBound, by: 0.0) == lowerBound)
//            XCTAssert(lerpImprecise(from: lowerBound, to: upperBound, by: 1.0) == upperBound)
//            XCTAssert(lerpImprecise(from: upperBound, to: lowerBound, by: 0.0) == upperBound)
//            XCTAssert(lerpImprecise(from: upperBound, to: lowerBound, by: 1.0) == lowerBound)
        }
    }
}

// imprecise method https://en.wikipedia.org/wiki/Linear_interpolation
func lerpImprecise(from a: Double, to b: Double, by t: Double) -> Double {
    a + t * (b - a)
}
