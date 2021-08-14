import UIKit
import SimpleImageViewer

extension UIImageView {
    
    @IBInspectable var isPreviewable: Bool {
        get {
            return false
        }
        set {
            addGester()
        }
    }
    
    func addGester() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedMe))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    @objc func tappedMe()
    {
        let configuration = ImageViewerConfiguration { config in
            config.imageView = self
        }
        guard let vc = self.parentContainerViewController() else {return}
        let imageViewerController = ImageViewerController(configuration: configuration)
        vc.present(imageViewerController, animated: true)
    }
}
