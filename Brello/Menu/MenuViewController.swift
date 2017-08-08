//
//  MenuViewController.swift
//  HeroExamples
//
//  Created by YiLun Zhao on 2017-02-09.
//  Copyright © 2017 Luke Zhao. All rights reserved.
//

import UIKit
import Hero
import QRCodeReader
import AVFoundation

class MenuViewController: UIViewController, QRCodeReaderViewControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hero_dismissViewController)))
  }

  @IBAction func viewPages(_ sender: Any) {
        let vc = viewController(forStoryboardName: "BuyStoryboard")
        
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
 }
    @IBAction func viewStore(_ sender: Any) {
        let vc = viewController(forStoryboardName: "BuyStoryboard")
        
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
                message: String (format:"%@ (of type %@)", result.value, result.metadataType),
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
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? MenuPageViewController, let sender = sender as? UIButton {
      sender.heroID = "selected"
      vc.view.heroModifiers = [.source(heroID: "selected")]
      vc.centerButton.heroID = "selected"
      vc.centerButton.heroModifiers = [.durationMatchLongest]
      vc.view.backgroundColor = sender.backgroundColor
      vc.centerButton.setImage(sender.image(for: .normal), for: .normal)
    }
  }
}

class MenuPageViewController: UIViewController {
  @IBOutlet weak var centerButton: UIButton!
}
