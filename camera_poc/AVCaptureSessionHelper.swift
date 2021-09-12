//
//  AVCaptureSessionHelper.swift
//  camera_poc
//
//  Created by gurrium on 2021/09/12.
//

import Foundation
import AVFoundation

final class AVCaptureSessionHelper {
    enum SessionSetupResult {
        case success, notAuthorized, configurationFailed
    }

    static let captureSession = AVCaptureSession()
    static var photoOutput: AVCapturePhotoOutput? {
        get {
            captureSession.outputs.first { $0 is AVCapturePhotoOutput } as? AVCapturePhotoOutput
        }
    }
    static private var setupResult = SessionSetupResult.success

    static func setup() {
        if setupResult != .success { return }

        let captureSession = AVCaptureSession()
        captureSession.beginConfiguration()

        let photoOutput = AVCapturePhotoOutput()
        guard let videoDevice = AVCaptureDevice.default(for: .video),
              let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
              captureSession.canAddInput(videoDeviceInput),
              captureSession.canAddOutput(photoOutput)
        else {
            setupResult = .configurationFailed
            return
        }

        captureSession.sessionPreset = .photo
        captureSession.addInput(videoDeviceInput)
        captureSession.addOutput(photoOutput)

        captureSession.commitConfiguration()
    }
}
