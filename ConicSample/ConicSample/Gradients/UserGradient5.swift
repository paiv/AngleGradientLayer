import UIKit


class UserGradient5 : UIControl {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        var colors: [CGColor] = []
        colors.append(UIColor(red: 1, green: 0, blue: 1, alpha: 1).cgColor)
        colors.append(UIColor(red: 1, green: 0, blue: 1, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 1, blue: 1, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 1, blue: 1, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor)
        colors.append(UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor)
        colors.append(UIColor(red: 1, green: 1, blue: 0, alpha: 1).cgColor)
        colors.append(UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor)
        colors.append(UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor)
        
        var locations: [Double] = []
        locations.append(0)
        locations.append(0.16)
        locations.append(0.162)
        locations.append(0.34)
        locations.append(0.342)
        locations.append(0.5)
        locations.append(0.502)
        locations.append(0.67)
        locations.append(0.672)
        locations.append(0.84)
        locations.append(0.842)
        locations.append(1)

        let layer = layer as! CAGradientLayer
        layer.type = .conic
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = colors
        layer.locations = locations as [NSNumber]
        layer.transform = CATransform3DMakeRotation(CGFloat.pi * 0.09, 0, 0, 1)
    }

    override var frame: CGRect {
        didSet {
            layer.cornerRadius = bounds.width / 2
        }
    }
}
