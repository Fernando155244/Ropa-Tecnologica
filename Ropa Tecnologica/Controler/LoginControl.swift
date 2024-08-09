//
//  LoginControl.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 6/27/24.
//

import Foundation
//import Almofire
//import SwiftyJSON
import UIKit

class LoginControler: UIViewController, UITextFieldDelegate	
{
    @IBOutlet weak var usuarioField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad()
    {
        var UsuarioFicticio = "FernandoOrozco"
        var passwordFicticio = "123"
        super.viewDidLoad()
        leerArchivoJson(filename: "WsDatos")
        usuarioField.delegate = self
        passwordField.delegate = self
        guardarDatosMemoria(key: "ClaveUsuario", value: UsuarioFicticio)
        guardarDatosMemoria(key: "password", value: passwordFicticio)
        guardarDatosMemoria(key: "Nombre", value: "El Fercho")
        guardarDatosMemoria(key: "e-Mail", value: "155244@udlondres.com")
        guardarDatosMemoria(key: "Genero", value: "M")
        guardarDatosMemoria(key: "Edad", value: "26")
        guardarDatosMemoria(key: "Telefono", value: "5548835143")
        guardarDatosMemoria(key: "Ocupacion", value: "Estudiante")
    }
    
    
    func login(name:String, pass:String)-> Bool
    {
        let nombre = "fer"
        let password = "123"
        
        if(name == nombre  && pass == password)
        {
            return true
        }
        else{
            return false
        }
        
    }
    
    
    
    func validacampos() -> Bool
    {
        var usuario = usuarioField.text
        var password = passwordField.text
        if (usuario == "" || password == "") {
            Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Faltan campos por llenar")
            usuarioField.backgroundColor = UIColor.red
            passwordField.backgroundColor = UIColor.red
            return false
        }else
        {
            usuarioField.backgroundColor = UIColor.white
            passwordField.backgroundColor = UIColor.white
            if(login(name: usuarioField.text!, pass: passwordField.text!))
            {
                return true
            }else{
                Mensaje.mostrarAlertaPrueba(en: self, mensaje: "usuatio o contraseña no son correctos")
                return false
            }
        }
    }
    
    
    
    
    
    
    func leerArchivoJson(filename name: String)  {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                    print("JSON: \(json)")
                    //guardarUsuarios(json: json)
                } else {
                    print("Given JSON is not a valid dictionary object.")
                }
            }
        } catch {
            print(error)
        }
    }
    
    
    
    @IBAction func ingresar_click(_ sender: Any)
    {
        if (validacampos())
        {
            var usuario = usuarioField.text
            var password = passwordField.text
            print(usuario)
        }else
        {
            
        }
        self.view.endEditing(true)
    }
    
    
    let userDefaults = UserDefaults.standard // clase para almacenar en la memoria
    
    /** funcion que permite guardar en la memoria del telefono*/
    func guardarDatosMemoria(key: String, value: Any) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
}
