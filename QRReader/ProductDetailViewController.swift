//
//  ProductDetailViewController.swift
//  QRReader
//
//  Created by Teja Ketepalle on 29/10/18.
//  Copyright © 2018 Teja Ketepalle. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var domainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var storeDescLabel: UILabel!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var productDetail : ProductDetail? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = productDetail?.qrc1.id
        domainLabel.text = productDetail?.qrc1.domain
        descriptionLabel.text = productDetail?.qrc1.description
        storeDescLabel.text = productDetail?.qrc1.validation.location.storeDescription
        fetchFromProducts() 
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ProductDetailEntity", in: context)
        let newProduct = NSManagedObject(entity: entity!, insertInto: context)
        newProduct.setValue(productDetail?.qrc1.id, forKey: "id")
        newProduct.setValue(productDetail?.qrc1.domain, forKey: "domain")
        newProduct.setValue(productDetail?.qrc1.description, forKey: "product_description")
        newProduct.setValue(productDetail?.qrc1.validation.location.storeDescription, forKey: "storeDescription")
        
         
         do {
         try context.save()
            savedProduct()
         } catch {
         print("Failed saving")
         }
    }
    
    func savedProduct() {
        let ac = UIAlertController(title: "Saved", message: "Product details saved.", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.navigationController!.popToRootViewController(animated: true)
        }))
        present(ac, animated: true)
    }

    func fetchFromProducts() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductDetailEntity")
        let context = appDelegate.persistentContainer.viewContext
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "product_description") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
    }
}
