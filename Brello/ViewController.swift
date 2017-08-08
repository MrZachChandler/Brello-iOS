//
//  ViewController.swift
//  Brello
//
//  Created by Zach Chandler on 7/14/17.
//  Copyright © 2017 Mad Men Software. All rights reserved.
//

import UIKit
import QRCode
import AVFoundation
import QRCodeReader
import Hero

class ViewController: UIViewController, QRCodeReaderViewControllerDelegate {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var brelloLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var brelloTitle: String!
    lazy var reader: QRCodeReader = QRCodeReader()
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [AVMetadataObjectTypeQRCode], captureDevicePosition: .back)
            $0.showTorchButton = true
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    @IBAction func scanCode(_ sender: Any) {
        guard checkScanPermissions() else { return }
        
        readerVC.modalPresentationStyle = .formSheet
        readerVC.delegate               = self
        
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            if let result = result {
                print("Completion with result: \(result.value)")
            }
        }
        
        present(readerVC, animated: true, completion: nil)
    }
    
    @IBAction func viewPages(_ sender: Any) {
        
        let vc = viewController(forStoryboardName: "MusicPlayer")
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    @IBAction func viewBars(_ sender: Any) {
        
        let vc = viewController(forStoryboardName: "CityGuide")
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    @IBAction func menu(_ sender: Any) {
        
        let vc = viewController(forStoryboardName: "Menu")
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = {
            var qrCode = QRCode("http://github.com/aschuch/QRCode")!
            qrCode.size = self.imageView.bounds.size
            qrCode.errorCorrection = .High
            return qrCode.image
        }()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func checkScanPermissions() -> Bool {
        do {
            return try QRCodeReader.supportsMetadataObjectTypes()
        } catch let error as NSError {
            let alert: UIAlertController?
            
            switch error.code {
            case -11852:
                alert = UIAlertController(title: "Error", message: "This app is not authorized to use Back Camera.", preferredStyle: .alert)
                
                alert?.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            case -11814:
                alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .alert)
                alert?.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            default:
                alert = nil
            }
            
            guard let vc = alert else { return false }
            
            present(vc, animated: true, completion: nil)
            
            return false
        }
    }
    

    // MARK: - QRCodeReader Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true) { [weak self] in
            let alert = UIAlertController(
                title: "QRCodeReader",
                message: String (format:"%@ (of type %@)", result.value),
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        if let cameraName = newCaptureDevice.device.localizedName {
            print("Switching capturing to: \(cameraName)")
        }
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
}

