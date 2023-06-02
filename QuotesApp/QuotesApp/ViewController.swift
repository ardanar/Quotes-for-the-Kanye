//
//  ViewController.swift
//  QuotesApp
//
//  Created by Arda Nar on 2.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        let url = URL(string: "https://api.kanye.rest")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil{
                print("error")
            }else{
                let json = try! JSONSerialization.jsonObject(with: data!) as! [String : String]
                DispatchQueue.main.async {
                    self.labelText.text = json["quote"]
                }
            }
        }
        task.resume()
        
    }
    
}

