////////////////////////////////////////////////////////////////////////////////
//
// Digital Atrium QR generator
// Copyright (c) 2018 Digital Atrium
// All Rights Reserved Worldwide
// Proprietary and Confidential - Not for Distribution
// Written by Digital Atrium.
//
// GTInputTextViewController.swift
//
// AUTHOR IDENTITY:
//		Goran Tokovic		3/8/18
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
import UIKit

////////////////////////////////////////////////////////////////////////////////
class GTInputTextViewController: UIViewController
{
    
    //UI
    @IBOutlet var textView: UITextView!
    
    //Data
    
    
    //MARK: - Life cicles
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Initializations
        
        self.dataInit()
        self.uiInit()
        self.setLocalizedText()
    }
    
    //MARK: - Initializations
    private func dataInit(){
        
    }
    
    private func uiInit(){
        
        //Gesture
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(disableEditing))
        self.view.addGestureRecognizer(tapGesture)
        
        self.configureUI()
    }
    
    private func configureUI(){
        
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                            target: view, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.textView.inputAccessoryView = keyboardToolbar
        
    }
    
    //MARK: - Localization
    private func setLocalizedText(){
        //Title
        self.title = NSLocalizedString("QR Generator", comment: "")
    }
    
    //MARK: - Gestures
    @IBAction func buttonPressed(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "qrPreview") as! GTQrCodePreviewViewController
        vc.text = self.textView.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func disableEditing(){
        self.view.endEditing(true)
    }
    
    //MARK: - Helpers
}
