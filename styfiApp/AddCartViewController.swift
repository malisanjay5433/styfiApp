//
//  AddCartViewController.swift
//  StyfiApp
//
//  Created by Sanjay Mali on 04/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit
import RealmSwift
class AddCartViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var addCart: UIButton!
    @IBOutlet weak var brand_name: UITextField!
    @IBOutlet weak var brand_desc: UITextField!
    @IBOutlet weak var product_Count: UITextField!
    @IBOutlet weak var last_modified: UITextField!
    @IBOutlet weak var logo:UIImageView!
    var selectedImag:UIImage?
    var data:NSData?
    let model = Brand_Info_Model()
    let datePickerView  : UIDatePicker = UIDatePicker()
    var date_start:Date?
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.brand_name.delegate = self
        self.brand_desc.delegate = self
        self.product_Count.delegate = self
        self.last_modified.delegate = self
        config_picker()
        appTitle()
        self.view.backgroundColor = UIColor.init(red: 235/255, green:235/255, blue: 235, alpha: 1.0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddCartViewController.selectPhotos))
        logo.isUserInteractionEnabled = true
        logo.addGestureRecognizer(tap)


    }
    func selectPhotos(){
//        print("Selecte Photos")
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
//        present(imagePicker, animated: true, completion: nil)
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePicker.modalPresentationStyle = .popover
        present(imagePicker, animated: true, completion: nil)
//        imagePicker.popoverPresentationController?.barButtonItem = sender
        
    }
    func appTitle(){
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:view.frame.width - 32, height:view.frame.height))
        titleLabel.text = "CART"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        navigationItem.titleView = titleLabel
        self.view.backgroundColor = UIColor.init(red: 235/255, green:235/255, blue: 235, alpha: 1.0)
        self.addCart.layer.cornerRadius = 3
        self.addCart.layer.borderColor = UIColor.white.cgColor
        self.addCart.layer.borderWidth = 3
        self.addCart.backgroundColor = UIColor.init(red: 50/255,green: 58/255,blue: 69/255,alpha: 1)
        self.addCart.layer.masksToBounds = true
        logo.layer.cornerRadius = 75
        logo.layer.masksToBounds = true
        logo.layer.borderColor = UIColor.init(red: 50/255,green: 58/255,blue: 69/255,alpha: 1).cgColor
        logo.layer.borderWidth  = 2.0
    }
    func config_picker()
    {
        datePickerView.datePickerMode = UIDatePickerMode.date
        last_modified.inputView = datePickerView
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.init(red: 50/255,green: 58/255,blue: 69/255,alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddCartViewController.date_done))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddCartViewController.date_cancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        last_modified.inputAccessoryView = toolBar
}
    func date_done(){
        date_start = datePickerView.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        self.last_modified.text = dateFormatter.string(from:date_start!)
        datePickerView.removeFromSuperview()
        last_modified.resignFirstResponder()
    }
    func date_cancel(){
        datePickerView.removeFromSuperview()
        last_modified.resignFirstResponder()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            logo.image = image
            self.selectedImag = image
//            let data = NSData(data: UIImageJPEGRepresentation(self.selectedImag!,0.9)!)
            let data = UIImagePNGRepresentation(self.selectedImag!) as NSData?
//            
//
//            let imgPNG = UIImage(data:data as Data,scale:1.0)
//            let dataPNGImg = NSData(data: UIImagePNGRepresentation(imgPNG!)!)
            self.data = data
            logo.contentMode = .scaleAspectFit
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
@IBAction func addCart(_ sender: Any) {
        let name = brand_name.text!
        let desc = brand_desc.text!
        let count = product_Count.text!
        let lastModify = last_modified.text!
        let selected_logo = logo
        if name == ""{
            print("enter Name")
        }else if desc == "" {
            print("enter desc")
        }else if count == "" {
            print("enter count")
        }else if lastModify == "" {
            print("enter lastModify")
        } else if logo == nil {
            print("enter logo")
        }
        else{
            model.brand_Name = name
            model.brand_Description = desc
            model.product_Count = count
            model.last_Modified_Date = lastModify
            model.brand_Logo = data
            persistData()
            self.dismiss(animated: true, completion: nil)
        }
}
    
    
    func persistData(){
        let realm = try! Realm()
        try! realm.write {
            realm.add(model)
            print("Saved Data")
        }
}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
