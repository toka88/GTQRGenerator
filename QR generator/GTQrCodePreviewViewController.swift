////////////////////////////////////////////////////////////////////////////////
//
// Digital Atrium QR generator
// Copyright (c) 2018 Digital Atrium
// All Rights Reserved Worldwide
// Proprietary and Confidential - Not for Distribution
// Written by Digital Atrium.
//
// GTQrCodePreviewViewController.swift
//
// AUTHOR IDENTITY:
//		Goran Tokovic		3/8/18
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
import UIKit

////////////////////////////////////////////////////////////////////////////////
class GTQrCodePreviewViewController: UIViewController
{
    
    //UI
    @IBOutlet var imageView: UIImageView!
    
    //Data
    var text : String?
    private var didSetup : Bool = false
    private var qrImage : CIImage?
    
    //MARK: - Life cicles
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Initializations
        
        self.dataInit()
        self.uiInit()
        self.setLocalizedText()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !self.didSetup {
            self.didSetup = true
            
            self.generateQRCode()
//            guard let qrCodeImage = self.qrImage else {
//                return
//            }
//
//            self.didSetup = true
//            let scaleX = self.imageView.frame.size.width / qrCodeImage.extent.size.width
//            let scaleY = self.imageView.frame.size.width / qrCodeImage.extent.size.height
//
//            let transformedImage = qrCodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
//
//            self.imageView.image = UIImage.init(ciImage: transformedImage)
        }
        
    }
    
    //MARK: - Initializations
    private func dataInit(){
//        print("ImageView: ", self.imageView)
//        if let image = self.convertTextToQRCode(self.text){
//            self.qrImage = image
//        }
    }
    
    private func uiInit(){
        
        
        
        self.configureUI()
    }
    
    private func configureUI(){
        
        
    }
    
    //MARK: - Localization
    private func setLocalizedText(){
        
    }
    
    //MARK: - Gestures
    
    //MARK: - Helpers
    
    private func generateQRCode(){
        let imageSize = CGSize.init(width: self.imageView.frame.size.width, height: self.imageView.frame.size.width)
        self.imageView.image = NDQRGenerator.generateQRCode(withText: text, size: imageSize)
        
    }
//    private func convertTextToQRCode(_ text : String?) -> CIImage? {
//        guard let validText = text else {
//            return nil
//        }
//
//        let data = validText.data(using: .utf8, allowLossyConversion: false)
//
//        if let filter = CIFilter.init(name: "CIQRCodeGenerator"){
//            filter.setValue(data, forKey: "inputMessage")
//            filter.setValue("H", forKey: "inputCorrectionLevel")
//            return filter.outputImage
//        }else{
//            return nil
//        }
//
//    }
}
