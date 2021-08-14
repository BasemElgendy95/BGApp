import UIKit


// MARK: - Methods

extension UITextField{
    //Allow to change the place holder of any TextField from story board attributes
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    // The control's corner radius.
    @IBInspectable override public var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    // The control's corner radius.
    @IBInspectable var leftPadding: CGFloat {
        set {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.size.height))
                self.leftView = paddingView
                self.leftViewMode = .always
        }
        get {
            return self.leftView?.width ?? 0.0
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat {
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
        get {
            return self.rightView?.width ?? 0.0
            
        }
    }
    
    @IBInspectable public var leftIcon: UIImage? {
        set{
            if R.string.localizable.app_lang().locale == "ar" {
                addPaddingRightIcon(newValue!, padding: 30)
            }else{
                addPaddingLeftIcon(newValue!, padding: 30)
            }
        }get{
            return nil
        }
    }
    @IBInspectable public var rightIcon: UIImage? {
        set{
            if R.string.localizable.app_lang().locale == "ar" {
                addPaddingLeftIcon(newValue!, padding: 16)
            }else{
                addPaddingRightIcon(newValue!, padding: 16)
            }
        }get{
            return nil
        }
    }
    
    public func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.leftView = imageView
        self.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    public func addPaddingRightIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 20))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.rightView = imageView
        self.rightView?.backgroundColor = .green
        self.rightViewMode = UITextField.ViewMode.always
    }
    
    @IBInspectable public var underLineColor: UIColor? {
        set{
            underLine(color: newValue!)
        }get{
            return nil
        }
    }
    public func underLine(color:UIColor)
    {
        self.borderStyle = UITextField.BorderStyle.none;
        let border = UIView()
        let width = CGFloat(1.0)
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.addSubview(border)
        self.layer.masksToBounds = true
    }
    
}
extension UITextField {
    
    func setInputViewDatePicker(target: Any, mode: UIDatePicker.Mode,selector: Selector) {
        var yearsfromNow: Date {
            return (Calendar.current as NSCalendar).date(byAdding: .year, value: -21, to: Date(), options: [])!
        }
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = mode
        datePicker.maximumDate = yearsfromNow
        datePicker.date = yearsfromNow
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } 
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    func addDataPicker(target: UIPickerViewDelegate, picker: UIPickerView, with tag: Int){
        self.inputView = picker
        picker.delegate = target
        picker.tag = tag
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: #selector(tapCancel))
        toolBar.setItems([cancel, flexible], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
