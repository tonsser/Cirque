import Foundation
import UIKit

struct ColorComponents {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}

extension UIColor {
    
    var coreImageColor: CoreImage.CIColor {
        return CoreImage.CIColor(color: self)
    }
    
    var components: ColorComponents {
        let color = coreImageColor
        return ColorComponents(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }
}
