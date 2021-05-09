import UIKit


class UserGradient2 : UIControl {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        var colors: [CGColor] = []
        colors.append(UIColor(white:0.65, alpha: 1).cgColor)
        colors.append(UIColor(white:0.55, alpha: 1).cgColor)
        colors.append(UIColor(white:0.35, alpha: 1).cgColor)
        colors.append(UIColor(white:0.75, alpha: 1).cgColor)
        colors.append(UIColor(white:0.9, alpha: 1).cgColor)
        colors.append(UIColor(white:0.75, alpha: 1).cgColor)
        colors.append(UIColor(white:0.35, alpha: 1).cgColor)
        colors.append(UIColor(white:0.75, alpha: 1).cgColor)
        colors.append(UIColor(white:0.9, alpha: 1).cgColor)
        colors.append(UIColor(white:0.65, alpha: 1).cgColor)

        let layer = layer as! CAGradientLayer
        layer.type = .conic
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = colors
        layer.borderColor = UIColor(white: 0.55, alpha: 1).cgColor
        layer.borderWidth = 1
    }
    
    override var frame: CGRect {
        didSet {
            layer.cornerRadius = bounds.width / 2
        }
    }
}
