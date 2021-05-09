import UIKit


class UserGradient6 : UIControl {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        var colors: [CGColor] = []
        for _ in 0..<6 {
            colors.append(UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor)
            colors.append(UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor)
            colors.append(UIColor(red: 1, green: 100/255, blue: 25/255, alpha: 1).cgColor)
            colors.append(UIColor(red: 1, green: 100/255, blue: 25/255, alpha: 1).cgColor)
        }
        colors.append(UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor)
        colors.append(UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor)
        
        let locations: [Double] = [0, 20, 21, 45, 46, 80, 81, 105, 106, 140, 141, 170, 171, 225, 226, 255, 256, 285, 286, 310, 311, 330, 331, 355, 356, 360]
            .map { $0 / 360 }
        
        let layer = layer as! CAGradientLayer
        layer.type = .conic
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = colors
        layer.locations = locations as [NSNumber]
        layer.transform = CATransform3DMakeRotation(CGFloat.pi * 0.125, 0, 0, 1)
    }
}
