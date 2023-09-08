import XCTest
@testable import Spark

extension Double {
    static func random16() -> Self {
        .random(in: Double(Int16.min)...Double(Int16.max))
    }
}

extension Point {
    static func random() -> Self {
        Point(x: Double.random16(), y: Double.random16())
    }
}

final class PointTests: XCTestCase {
    
    let loops = 1000
    
    func testAddition() {
        for _ in 1...loops {
            let a = Point.random()
            let b = Point.random()
            let c = Point.random()
            XCTAssertEqual(a + b, b + a, "commutativity")
            XCTAssertEqual((a + b) + c, a + (b + c), "associativity")
            XCTAssertEqual(a + .zero, a, "identity")
        }
    }
    
    func testSubtraction() {
        let a = Point.random()
        let b = Point.random()
        XCTAssertEqual(a - b, -(b - a), "anti-commutativity")
        // non-associativity?
        // predecessor?
    }
    
    func testScalarMultiplication() {
        
    }
}

extension Vector {
    static func random() -> Self {
        Vector(dx: Double.random16(), dy: Double.random16())
    }
}

final class VectorTests: XCTestCase {
    
    static let iterations = 1000
    static var testSample: [(v: Vector, w: Vector, a: Double, b: Double)] = []
    
    let loops = 1000
    
    func assertEqual(
        _ v1: Vector,
        _ v2: Vector,
        accuracy: Double = 1e-6,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssert(abs(v1.dx - v2.dx) < accuracy && abs(v1.dy - v2.dy) < accuracy, message(), file: file, line: line)
    }
    
    override class func setUp() {
        testSample = (1...iterations).map { _ in
            (Vector.random(), Vector.random(), Double.random16(), Double.random16())
        }
    }
    
    override class func tearDown() {
        testSample.removeAll(keepingCapacity: false)
    }
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    // *
    
    func testMultiplicationScalarAdditivity() {
        for (v, _, a, b) in Self.testSample {
            assertEqual((a + b) * v, a * v + b * v, "Additivity in the scalar")
        }
    }
    
    func testMultiplicationVectorAdditivity() {
        for (v, w, a, _) in Self.testSample {
            assertEqual(a * (v + w), a * v + a * w, "Additivity in the vector")
        }
    }
    
    func testMultiplicationProductOfScalars() {
        for (v, _, a, b) in Self.testSample {
            assertEqual((a * b) * v, a * (b * v), accuracy: 1e-2, "Additivity in the scalar")
        }
    }
    
    func testMultiplicationZero() {
        for (v, _, _, _) in Self.testSample {
            assertEqual(v * 0.0, .zero, "zero")
        }
    }
    
    func testMultiplicationIdentity() {
        for (v, _, _, _) in Self.testSample {
            assertEqual(v * 1.0, v, "identity")
        }
    }
    
    func testMultiplicationInverse() {
        for (v, _, _, _) in Self.testSample {
            assertEqual(v * -1.0, -v, "inverse")
        }
    }
}
