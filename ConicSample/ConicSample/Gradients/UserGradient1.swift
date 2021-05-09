import UIKit


class UserGradient1 : UIView {

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        var colors: [CGColor] = []
        var locations: [Double] = []
        for i in 0..<5 {
            colors.append(UIColor(red: 252/255, green: 253/255, blue: 203/255, alpha: 1).cgColor)
            colors.append(UIColor(red: 250/255, green: 96/255, blue: 53/255, alpha: 1).cgColor)
            locations.append(0.2 * Double(i))
            locations.append(0.2 * Double(i) + 0.04)
        }
        colors.append(UIColor(red: 252/255, green: 253/255, blue: 203/255, alpha: 1).cgColor)
        locations.append(1)
        
        let layer = layer as! CAGradientLayer
        layer.type = .conic
        layer.startPoint = CGPoint(x: 0.5, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.colors = colors
        layer.locations = locations as [NSNumber]
    }
    
    override var frame: CGRect {
        didSet {
            squareLayer()
        }
    }
    
    override var bounds: CGRect {
        didSet {
            squareLayer()
        }
    }
    
    func squareLayer() {
        let w = max(bounds.width, bounds.height)
        let square = CGRect(x: 0, y: 0, width: w, height: w)
        layer.bounds = square
    }
}
