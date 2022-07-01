//
//  FlashUsable.swift
//  
//
//  Created by Alejandro Guerra on 1/7/22.
//
#if os(iOS)
import Foundation
import UIKit
import AVFoundation

public protocol FlashUsable{
    func setFlashlight(with torchMode: AVCaptureDevice.TorchMode)
}


public extension FlashUsable {
    func setFlashlight(with torchMode: AVCaptureDevice.TorchMode) {
        guard
            let device = AVCaptureDevice.default(for: .video),
            device.hasTorch
        else {
            return
        }

        try? device.lockForConfiguration()
        try? device.setTorchModeOn(level: 1.0)
        device.torchMode = torchMode
        device.unlockForConfiguration()
    }
}
#endif
