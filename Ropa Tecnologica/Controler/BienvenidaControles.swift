//
//  BienvenidaControles.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 6/27/24.
//

import Foundation
//import Almofire
//import SwiftyJSON
import UIKit

class BienvenidaController : UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var nombrelbl: UILabel!
    @IBOutlet weak var correolbl: UILabel!
    @IBOutlet weak var Generolbl: UILabel!
    @IBOutlet weak var generoIM: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad();
        var nombreCompleto = "Fernando Omar Orozco Ruiz"
        var correo = "155244@udlondres.com"
        var genero = "M"
        nombrelbl.text = "Bienvenido " + nombreCompleto
        correolbl.text = correo
        if genero == "M"
        {
            correolbl.text = "Es Hombre"
            generoIM.image = UIImage(named: "AvatarMasculino")
        }else if genero == "F"
        {
            correolbl.text = "Es mujer"
            generoIM.image = UIImage(named: "AvatarFemenino")
        }else{
            correolbl.text = "Es de otro genero"
            generoIM.image = UIImage(named: "GeneroNeutro")
        }
    }
    let userDefaults = UserDefaults.standard
    /*
     func guardarDatosMemoria (key: String, value: Any)
     {
         userDefaults.set(value, forKey: key)
         userDefaults.synchronize()
     }
     */
    func obtenerDatos (key: String) -> Any
    {
        var datos = userDefaults.data(forKey: key)
        return datos
    }
}
