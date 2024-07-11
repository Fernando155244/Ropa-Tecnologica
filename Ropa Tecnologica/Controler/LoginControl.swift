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
        super.viewDidLoad()
        leerArchivoJson(filename: "Usuarios")
        usuarioField.delegate = self
        passwordField.delegate = self
        //leerArchivoJson(filename: "Usuarios")
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
    func validaLogin (usuario: String?, password: String?)-> Bool
    {
        var respuesta = false
        var UsuarioFicticio = "FernandoOrozco"
        var passwordFicticio = "123"
        if (usuario == UsuarioFicticio && password == passwordFicticio)
        {
            respuesta = false
            guardarDatosMemoria(key: "ClaveUsuario", value: UsuarioFicticio)
            guardarDatosMemoria(key: "password", value: passwordFicticio)
            guardarDatosMemoria(key: "Nombre", value: "El Fercho")
            guardarDatosMemoria(key: "e-Mail", value: "155244@udlondres.com")
            guardarDatosMemoria(key: "Genero", value: "M")
            guardarDatosMemoria(key: "Edad", value: 26)
        }else
        {
            respuesta = false
        }
        return respuesta
    }
    let userDefaults = UserDefaults.standard
    func guardarDatosMemoria (key: String, value: Any)
    {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    func validaDatosLogin () -> Bool
    {
        var Usuario = usuarioField.text
        var password = passwordField.text
        if (Usuario == "")
        {
            Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Capture el usuario")
            usuarioField.backgroundColor = UIColor.yellow
            return false
        }
        else if (password == "")
        {
            Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Capture el password")
            usuarioField.backgroundColor = UIColor.yellow
            return false
        } else{
            usuarioField.backgroundColor = UIColor.white
            passwordField.backgroundColor = UIColor.white
            if (validaLogin(usuario: Usuario, password: password))
            {
                return true
            }else{
                Mensaje.mostrarAlertaPrueba(en: self, mensaje: "Usuario y contraseña no valido")
                return false
            }
        }
    }
    @IBAction func logear (sender: Any)
    {
        var Respuesta: Bool = validaLogin(usuario: usuarioField.text, password: passwordField.text)
        if Respuesta == true
        {
            self.view.endEditing(true)
        }
        /*if validaDatosLogin() == true
        {
            var usuario = usuarioField.text
            var contrasenia = passwordField.text
         print(usuario)
         print(password)
        }*/		
    }
}
