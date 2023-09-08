//
//  File.swift
//  
//
//  Created by André Vants on 08/05/23.
//

import Foundation

public func easeInQuadratic(_ t: Double) -> Double {
    t * t
}

public func easeInCubic(_ t: Double) -> Double {
    t * t * t
}

public func easeInQuartic(_ t: Double) -> Double {
    t * t * t * t
}

public func easeInQuintic(_ t: Double) -> Double {
    t * t * t * t * t
}

public func easeInExponential(_ t: Double) -> Double {
    t == 0.0 ? 0.0 : pow(2, 10 * (t - 1))
}

public func easeInSine(_ t: Double) -> Double {
    1 - cos(t * .pi / 2)
}

public func easeInCircular(_ t: Double) -> Double {
    1 - sqrt(1 - t * t)
}

public func easeInBack(_ t: Double) -> Double {
    let c = 1.70158
    return t * t * ((c + 1) * t - c)
}

public func easeInElastic(_ t: Double) -> Double {
    sin(13 * .pi/2 * t) * pow(2, 10 * (t - 1))
}

public func easeInBounce(_ t: Double) -> Double {
    1 - easeOutBounce(1 - t)
}



public func easeOutQuadratic(_ t: Double) -> Double {
    t * (2 - t)
}

public func easeOutCubic(_ t: Double) -> Double {
    let f = 1 - t
    return 1 - f * f * f
}

public func easeOutQuartic(_ t: Double) -> Double {
    let f = 1 - t
    return 1 - f * f * f * f
}

public func easeOutQuintic(_ t: Double) -> Double {
    let f = 1 - t
    return 1 - f * f * f * f * f
}

//public func easeOutExponential(_ t: Double) -> Double {
//
//}

public func easeOutSine(_ t: Double) -> Double {
    sin(t * .pi / 2)
}

//public func easeOutCircular(_ t: Double) -> Double {
//
//}
//
//public func easeOutBack(_ t: Double) -> Double {
//
//}
//
//public func easeOutElastic(_ t: Double) -> Double {
//
//}

public func easeOutBounce(_ t: Double) -> Double {
    let a = 7.5625
    let b = 2.75
    if t < 1 / b {
        return a * t * t
    } else if t < 2 / b {
        let f = t - 1.5 / b
        return a * f * f + 0.75
    } else if t < 2.5 / b {
        let f = t - 2.25 / b
        return a * f * f + 0.9375
    } else {
        let f = t - 2.625 / b
        return a * f * f + 0.984375
    }
}




//func easeInOutQuadratic(_ t: Double) -> Double {
//
//}

public func easeInOutSine(_ t: Double) -> Double {
//    -(cos(t * .pi) - 1) / 2
    (1 - cos(t * .pi)) / 2 //* 0.5
}
