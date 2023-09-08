import SpriteKit

public typealias Point = CGPoint
public typealias Vector = CGVector
public typealias Rect = CGRect
public typealias Size = CGSize

public func lerp(from a: Double, to b: Double, by t: Double) -> Double {
    (1.0 - t) * a + t * b
}

// point

extension Point: AdditiveArithmetic {
    
    public static func + (left: Self, right: Self) -> Self {
        return Self(x: left.x + right.x, y: left.y + right.y)
    }
    
    public static func - (left: Self, right: Self) -> Self {
        return Self(x: left.x - right.x, y: left.y - right.y)
    }
}

extension Point {
    
    public init(vector: Vector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    static prefix func - (operand: Self) -> Self {
        return Self(x: -operand.x, y: -operand.y)
    }
    
    public static func * (point: Self, scalar: Double) -> Self {
        return Self(x: point.x * scalar, y: point.y * scalar)
    }
    
    
    
    public static func + (point: Self, vector: Vector) -> Self {
        return Self(x: point.x + vector.dx, y: point.y + vector.dy)
    }
}



//

public func / (point: Point, size: Size) -> Point {
    Point(x: point.x / size.width, y: point.y / size.height)
}

public func / (size: Size, scalar: Double) -> Size {
    Size(width: size.width / scalar, height: size.height / scalar)
}

// vector

extension Vector: AdditiveArithmetic {
    
    public static func + (left: Self, right: Self) -> Self {
        return Self(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    public static func - (left: Self, right: Self) -> Self {
        return Self(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }
}

public extension Vector {
    
    static prefix func - (operand: Self) -> Self {
        return Self(dx: -operand.dx, dy: -operand.dy)
    }
    
//    static func * (vector: Vector, scalar: Double) -> Vector {
//        Vector(dx: vector.dx * scalar, dy: vector.dy * scalar)
//    }
    
//    static func * (vector: Vector, scalar: Int) -> Vector {
//        Vector(dx: vector.dx * Double(scalar), dy: vector.dy * Double(scalar))
//    }
//
//    static func * (scalar: Int, vector: Vector) -> Vector {
//        Vector(dx: vector.dx * Double(scalar), dy: vector.dy * Double(scalar))
//    }
    
    static func * (vector: Vector, scalar: Double) -> Vector {
        Vector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static func * (scalar: Double, vector: Vector) -> Vector {
        Vector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    func normalized() -> Vector {
        let length = sqrt(dx * dx + dy * dy)
        return length > 0 ? Vector(dx: dx / length, dy: dy / length) : .zero
    }
}
