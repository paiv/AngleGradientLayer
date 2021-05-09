import UIKit

class SampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in self.view.subviews {
            if let control = view as? UIControl {
                control.addTarget(self, action: #selector(handleDragInside(sender:forEvent:)), for: .touchDragInside)
            }
        }
    }

    @IBAction func handleDragInside(sender: UIControl, forEvent event: UIEvent) {
        sender.superview?.bringSubviewToFront(sender)
        if let touch = event.allTouches?.first {
            sender.center = touch.location(in: sender.superview!)
        }
    }
}
