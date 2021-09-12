//
//  AppDelegate.swift
//  camera_poc
//
//  Created by gurrium on 2021/09/12.
//

import Foundation
import UIKit
import AVFoundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            AVCaptureSessionHelper.setup()
        case .notDetermined, .restricted, .denied:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    AVCaptureSessionHelper.setup()
                }
            }
        @unknown default:
            return false
        }

        return true
    }
}
