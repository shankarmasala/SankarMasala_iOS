//
//  PersonalInfoTableViewCell.swift
//  ShankarMasala
//
//  Created by Nimit Bagadiya on 03/04/19.
//  Copyright © 2019 Narendra Mistri. All rights reserved.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        txtEmail.layer.borderWidth = 1.5
        txtEmail.layer.borderColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0).cgColor
        
        txtEmail.placeholder = "Email"
        
        txtPhoneNumber.layer.borderWidth = 1.5
        txtPhoneNumber.layer.borderColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0).cgColor
        
        txtPhoneNumber.placeholder = "Phone number"
        
        txtFirstName.layer.borderWidth = 1.5
        txtFirstName.layer.borderColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0).cgColor
        
        txtFirstName.placeholder = "First name"
        
        txtLastName.layer.borderWidth = 1.5
        txtLastName.layer.borderColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0).cgColor
        
        txtLastName.placeholder = "Last name"
        
        
        let imageView1 = UIImageView();
        let viewMail1 = UIView()
        viewMail1.frame = CGRect(x: 0, y: 0, width: 58, height: 50)
        imageView1.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView1.backgroundColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0)
        viewMail1.addSubview(imageView1)
        txtEmail.leftViewMode = .always
        txtEmail.leftView = viewMail1;
        
        let imageView2 = UIImageView();
        let viewMail2 = UIView()
        viewMail2.frame = CGRect(x: 0, y: 0, width: 58, height: 50)
        imageView2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView2.backgroundColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0)
        viewMail2.addSubview(imageView2)
        txtPhoneNumber.leftViewMode = .always
        txtPhoneNumber.leftView = viewMail2;
        
        
        let imageView3 = UIImageView();
        let viewMail3 = UIView()
        viewMail3.frame = CGRect(x: 0, y: 0, width: 58, height: 50)
        imageView3.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView3.backgroundColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0)
        viewMail3.addSubview(imageView3)
        txtFirstName.leftViewMode = .always
        txtFirstName.leftView = viewMail3;
        
        
        let imageView4 = UIImageView();
        let viewMail4 = UIView()
        viewMail4.frame = CGRect(x: 0, y: 0, width: 58, height: 50)
        imageView4.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView4.backgroundColor = UIColor(red: 225/255.0, green: 62/255.0, blue: 67/255.0, alpha: 1.0)
        viewMail4.addSubview(imageView4)
        txtLastName.leftViewMode = .always
        txtLastName.leftView = viewMail4;
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
