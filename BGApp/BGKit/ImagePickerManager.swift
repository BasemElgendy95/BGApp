//
//  ImagePickerManger.swift
//  Fajr-Teacher
//
//  Created by BasemElgendy on 24/03/2020.
//  Copyright © 2020 BasemElgendy. All rights reserved.
//

import Foundation
import UIKit
import PhotosUI

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var picker = UIImagePickerController()
    
    var alert = UIAlertController(title: R.string.localizable.file_type().locale, message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?

    override init(){
        super.init()
    }

    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;

        let cameraAction = UIAlertAction(title: R.string.localizable.camera().locale, style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: R.string.localizable.gallery().locale, style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: R.string.localizable.cancel().locale, style: .cancel){
            UIAlertAction in
        }

        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            BGAlertPresenter.displayToast(title: R.string.localizable.sorry(), message: R.string.localizable.your_device_not_support_camera(), type: .error)
        }
    }
    func openGallery(){
        if #available(iOS 14, *) {
            var configuration = PHPickerConfiguration()
            configuration.selectionLimit = 1
            configuration.filter = .images
            configuration.filter = .any(of: [.images])
            let PHPicker = PHPickerViewController(configuration: configuration)
            PHPicker.delegate = self
            self.viewController!.present(PHPicker, animated: true, completion: nil)
        } else {
            alert.dismiss(animated: true, completion: nil)
            picker.sourceType = .photoLibrary
              
            self.viewController!.present(picker, animated: true, completion: nil)
        }
        
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //for swift below 4.2
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //    picker.dismiss(animated: true, completion: nil)
    //    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    //    pickImageCallback?(image)
    //}

    // For Swift 4.2+
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image)
    }



    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }

}

extension ImagePickerManager: PHPickerViewControllerDelegate {
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        guard !results.isEmpty else { return }
        guard let provider = results.first?.itemProvider else {return}
        guard  provider.canLoadObject(ofClass: UIImage.self) else {return}
        provider.loadObject(ofClass: UIImage.self) { (image, error) in
            DispatchQueue.main.async { [self] in
                    if let image = image as? UIImage {
                        self.pickImageCallback?(image)
                    }
                }
       }
    }
}
