import UIKit
import WLEmptyState
import Lottie
extension UIViewController:  WLEmptyStateDelegate {
    public func enableScrollForEmptyState() -> Bool {
            // To enable/disable the scroll return true or false
            return true
        }
}
extension UIViewController :  WLEmptyStateDataSource {
    public func imageForEmptyDataSet() -> UIImage? {
        return R.image.no_data_found()
    }
    public func titleForEmptyDataSet() -> NSAttributedString {
        let font =  UIFont.systemFont(ofSize: 10, weight: .regular)
        let attributes = [NSAttributedString.Key.font: font]
        let title = NSAttributedString(string: R.string.localizable.no_data_found().locale, attributes: attributes)
        return title
    }
    public func descriptionForEmptyDataSet() -> NSAttributedString {
        let font =  UIFont.systemFont(ofSize: 10, weight: .bold)
        let attributes = [NSAttributedString.Key.font: font]
        let title = NSAttributedString(string: R.string.localizable.please_try_again_later().locale, attributes: attributes)
        return title
    }
    public func customViewForEmptyState() -> UIView? {
        let mainView = view
        let contanirView = UIView()
        var animationView: AnimationView?
        animationView = .init(name: "not_data")
        animationView!.frame =  CGRect(x: ((mainView?.frame.maxX)! / 2 ) - 50 , y: ((mainView?.frame.maxY)! / 2 ) - 100 , width: 100, height: 100)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        animationView!.play()
        contanirView.addSubview(animationView!)
        return contanirView
    }
}



