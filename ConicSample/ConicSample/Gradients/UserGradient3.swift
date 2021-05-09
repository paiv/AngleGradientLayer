import UIKit


class UserGradient3 : UIControl {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        var colors: [CGColor] = []
        colors.append(UIColor(red: 1, green: 1, blue: 0.4, alpha: 1).cgColor)
        colors.append(UIColor(red: 0, green: 0, blue: 0.5, alpha: 1).cgColor)

        let layer = layer as! CAGradientLayer
        layer.type = .conic
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = colors
    }
}
