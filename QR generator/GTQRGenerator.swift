////////////////////////////////////////////////////////////////////////////////
//
// Digital Atrium QR generator
// Copyright (c) 2018 Digital Atrium
// All Rights Reserved Worldwide
// Proprietary and Confidential - Not for Distribution
// Written by Digital Atrium.
//
// NDQRGenerator.swift
//
// AUTHOR IDENTITY:
//		Goran Tokovic		3/9/18
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
import UIKit

////////////////////////////////////////////////////////////////////////////////
class GTQRGenerator {
    
    /// Generate QR code with passed data
    ///
    /// - Parameters:
    ///   - text: text
    ///   - aSize: image size in pixels
    ///   - aColor: qr code foreground color. Default color is black
    ///   - aBackgroundColor: qr code background color. Default color is clear
    /// - Returns: generated image with QR code
    class func generateQRCode(withText text: String?, size aSize: CGSize?, color aColor: UIColor = UIColor.black, andBackgroundColor aBackgroundColor: UIColor = UIColor.clear) -> UIImage?{
        
        guard let validText = text, let imageSize = aSize else {
            return nil
        }
        
        if let qrImage = self.generateBasicQRCode(withText: validText, andSize: imageSize){
            if let customizedImage = self.customize(QRImage: qrImage, withForegroundColor: aColor, andBackgroundColor: aBackgroundColor){
                
                return UIImage.init(ciImage: customizedImage)
            }
        }
        return nil
    }
    
    class private func generateBasicQRCode(withText text: String, andSize imageSize: CGSize) -> CIImage?{
        
        let data = text.data(using: .utf8, allowLossyConversion: false)
        
        if let filter = CIFilter.init(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")
            
            if let qrCodeImage = filter.outputImage{
                
                let scaleX = imageSize.width / qrCodeImage.extent.size.width
                let scaleY = imageSize.height / qrCodeImage.extent.size.height
                
                let transformedImage = qrCodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                return transformedImage
            }else{
                return nil
            }
        }else{
            return nil
        }
    }
    
    class private func customize(QRImage image : CIImage, withForegroundColor fColor: UIColor, andBackgroundColor bColor: UIColor) -> CIImage?{
        
        let color = CIColor.init(cgColor: fColor.cgColor)
        let backgroundColor = CIColor.init(cgColor: bColor.cgColor)
        
        guard let colorFilter = CIFilter(name: "CIFalseColor") else { return nil }
        
        colorFilter.setDefaults()
        colorFilter.setValue(image, forKey: "inputImage")
        colorFilter.setValue(color, forKey: "inputColor0")
        colorFilter.setValue(backgroundColor, forKey: "inputColor1")
        
        return colorFilter.outputImage
        
    }
}
