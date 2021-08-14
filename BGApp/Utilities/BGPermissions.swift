//
//  BGPermissions.swift
//  BGApp
//
//  Created by BasemElgendy on 11/08/2021.
//

import Foundation
import SPPermissions

class BGPermissions {
    
    static let manager = BGPermissions()
    fileprivate let notificationAuthorized = SPPermissions.Permission.notification.authorized
    fileprivate let cameraAuthorized = SPPermissions.Permission.camera.authorized
    fileprivate let photoLibraryAuthorized = SPPermissions.Permission.photoLibrary.authorized
    fileprivate let locationAlwaysAuthorized = SPPermissions.Permission.locationAlways.authorized
    fileprivate var permissions: [SPPermissions.Permission] = []
    fileprivate var controller : SPPermissionsDialogController!
    
     fileprivate func setupPermissions(){
        if !notificationAuthorized {
            permissions.append(.notification)
        }
        if !cameraAuthorized {
            permissions.append(.camera)
        }
        if !photoLibraryAuthorized {
            permissions.append(.photoLibrary)
        }
        if !locationAlwaysAuthorized {
            permissions.append(.locationAlways)
        }
    }
    
    
     fileprivate func setController() -> Bool{
        setupPermissions()
        controller = SPPermissions.dialog(permissions)
        controller.dismissCondition = .allPermissionsAuthorized
        controller.allowSwipeDismiss = true
        return true
    }

    func getPermissions(_ currentController: UIViewController){
        guard setController() else{return}
        DispatchQueue.main.async { [self] in
            controller.present(on: currentController)
        }
    }
   
    
}

extension BGPermissions : SPPermissionsDataSource, SPPermissionsDelegate{
    func configure(_ cell: SPPermissionsTableViewCell, for permission: SPPermissions.Permission) {
        // for each permission
        cell.permissionTitleLabel.text = "Title"
        cell.permissionDescriptionLabel.text = "Description"
        cell.permissionIconView.setPermissionType(.notification)
        cell.permissionIconView.setCustomImage(R.image.no_data_found()!)
       
    }
    
    func deniedAlertTexts(for permission: SPPermissions.Permission) -> SPPermissionsDeniedAlertTexts? {
        // for each permission
        let texts = SPPermissionsDeniedAlertTexts()
        texts.titleText = "Permission denied"
        texts.descriptionText = "Please, go to Settings and allow permission."
        texts.actionText = "Settings"
        texts.cancelText = "Cancel"
        return texts
    }
}
