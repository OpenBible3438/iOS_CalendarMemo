//
//  EditViewController.swift
//  CalendarMemo
//
//  Created by 편성경 on 2022/11/09.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentsView: UITextView!
    @IBOutlet weak var closeImage: UIImageView!
    
    var selectedDate: String!
    var selectedContents: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = selectedDate
        contentsView.text = selectedContents
        
        // X mark Image Event
        let closeImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(closePage))
        closeImage.isUserInteractionEnabled = true
        closeImage.addGestureRecognizer(closeImageTapGesture)

    }
    
    @objc func closePage() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
