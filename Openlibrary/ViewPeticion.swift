//
//  ViewPeticion.swift
//  Openlibrary
//
//  Created by Jose Luis Garcia Dueñas on 12/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import UIKit

class ViewPeticion: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        TextoISBN.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func textFieldDoneEditing(sender:UITextField)
    {
        sender.resignFirstResponder() // desaparece el teclado
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonLimpiar(sender: AnyObject) {
        TextoISBN.text = ""
    }
    @IBOutlet weak var TextoISBN: UITextField!
    @IBAction func ButtonBuscarISBN(sender: AnyObject) {
        if TextoISBN.text == "" {
            
        } else {
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + TextoISBN.text!
            let url = NSURL(string: urls)
            let datos:NSData? = NSData(contentsOfURL: url!)
            let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
            print(texto!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
