//
//  PreviewView.swift
//  camera_poc
//
//  Created by gurrium on 2021/09/12.
//

import SwiftUI
import AVFoundation

struct PreviewView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
       let view =  _PreviewView()
        view.videoPreviewLayer.session = AVCaptureSessionHelper.captureSession

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

private class _PreviewView: UIView {
    override static var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
    }
}
