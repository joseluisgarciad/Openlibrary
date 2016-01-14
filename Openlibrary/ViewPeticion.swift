//
//  ViewPeticion.swift
//  Openlibrary
//
//  Created by Jose Luis Garcia Dueñas on 12/1/16.
//  Copyright © 2016 Jose Luis Garcia Dueñas. All rights reserved.
//

import UIKit

class ViewPeticion: UIViewController, UITextFieldDelegate {

    var ResISBN:NSString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextoISBN.delegate = self
        TextoISBN.returnKeyType = UIReturnKeyType.Search
        //textField.keyboardType = UIKeyboardTypeWebSearch;
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
        
    }
    @IBOutlet weak var ViewTextISBN: UITextView!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if TextoISBN.text == "" {
        } else {
            let sigVista=segue.destinationViewController as!ViewDatosISBN
            sigVista.inputISBN = FunBuscaISBN(TextoISBN.text!) as String
            TextoISBN.text = ""
        }
    }
    
    func FunBuscaISBN(ISBN:String) -> String {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + ISBN
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let ResISBN = NSString(data:datos!, encoding:NSUTF8StringEncoding)

        return ResISBN! as String
    }
    
    func mensaje (Titulo: String, Texto: String) {
        let alertController = UIAlertController(title: Titulo, message:
            Texto, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Cerrar", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
