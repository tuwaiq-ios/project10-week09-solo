//
//  NewSearchVC.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//

import UIKit

class NewSearchVC: UIViewController, UITextFieldDelegate {
    
    var data: Search?
    
    let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit your searching"
        view.backgroundColor = .white
     
    
        
        textView.contentInsetAdjustmentBehavior = .automatic
         textView.center = self.view.center
         textView.textAlignment = NSTextAlignment.justified
         textView.backgroundColor = UIColor.lightGray
         textView.backgroundColor = UIColor(red: 39/255, green: 53/255, blue: 182/255, alpha: 1)
         textView.font = UIFont.systemFont(ofSize: 20)
         textView.textColor = UIColor.white
         textView.font = UIFont.boldSystemFont(ofSize: 20)
         textView.font = UIFont(name: "Verdana", size: 17)
         textView.isSelectable = true
         textView.isEditable = false
         textView.dataDetectorTypes = UIDataDetectorTypes.link
         textView.layer.cornerRadius = 10
         textView.autocorrectionType = UITextAutocorrectionType.yes
         textView.spellCheckingType = UITextSpellCheckingType.yes
        
         textView.isEditable = true
         
         self.view.addSubview(textView)
        
        
        
        
        
        textView.text = data?.content
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textView.resignFirstResponder()
        data?.content = textView.text ?? ""
        guard let note = data else { return true }
        SearchService.shared.updateOrAddNewSearch(note: note)
        return true
    }
}
