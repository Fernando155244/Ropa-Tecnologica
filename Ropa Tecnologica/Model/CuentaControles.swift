//
//  CuentaControles.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 7/9/24.
//

import Foundation
import UIKit
class CuentaControles : UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var generoIM: UIImageView!
    @IBOutlet weak var NombreTXT: UITextField!
    @IBOutlet weak var CorreoTXT: UITextField!
    @IBOutlet weak var EdadTXT: UITextField!
    @IBOutlet weak var TelefonoTXT: UITextField!
    @IBOutlet weak var OcupacionTXT: UITextField!
    override func viewDidLoad()
    {
        //Las partes en los comentarios las pondre cuando encuentre el error
        var Genero: String = "M" //obtenerDatos(key: "") as? String
        var Nombre: String = "Fernando Orozco" //obtenerDatos(key: "") as? String
        var Correo: String = "155244@udlondres.com" //obtenerDatos(key: "") as? String
        var Edad: Int = 24//obtenerDatos(key: "") as? String
        var Telefono: String = "5543861144"//obtenerDatos(key: "") as? String
        var Ocupacion: String = "Estudiante"//obtenerDatos(key: "") as? String
        
        if Genero == "M"
        {
            generoIM.image = UIImage(named: "AvatarMasculino")	
        }else if Genero == "F"
        {
            generoIM.image = UIImage(named: "AvatarFemenino")
        }else{
            generoIM.image = UIImage(named: "GeneroNeutro")
        }
        NombreTXT.text = Nombre
        CorreoTXT.text = Correo
        EdadTXT.text =  String(Edad)
        TelefonoTXT.text = Telefono
        OcupacionTXT.text = Ocupacion
    }
}
