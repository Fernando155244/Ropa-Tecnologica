//
//  ProductoDetalleViewController.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 8/8/24.
//

import Foundation
import UIKit
class ProductoDetalleViewController: UIViewController
{
    var producto: Producto?
    @IBOutlet weak var productoImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productoImageView.image = UIImage(named: producto?.image ?? "")
    }
}
