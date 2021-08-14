import UIKit

extension UIScrollView {
    func scrollToTopOfScreen() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}
