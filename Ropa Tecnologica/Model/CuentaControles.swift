//
//  CuentaControles.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 7/9/24.
//

import Foundation
import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("HElloWorkd")
            .padding()
    }
    private func readFile()
    {
        if let url = Bundle.main.url(forResource: "Usuarios", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data)
            {
                print(jsonData.Usuarios)
            }
        }
    }
}
struct JSONData: Decodable{
    let Usuarios: [Usuario]
}
struct Usuario: Decodable //, Identifiable
{
    let Nombre: String
    let Email: String
    let Usuario: String
    let Contrasenia: String
    let Genero: String
    let Direccion: String
}
class CuentaControles : UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var generoIM: UIImageView!
    @IBOutlet weak var NombreTXT: UITextField!
    @IBOutlet weak var CorreoTXT: UITextField!
    @IBOutlet weak var GeneroTXT: UITextField!
    @IBOutlet weak var EdadTXT: UITextField!
    @IBOutlet weak var TelefonoTXT: UITextField!
    @IBOutlet weak var OcupacionTXT : UITextField!
    @IBOutlet weak var GuardarBTN: UIButton!
    
    override func viewDidLoad()
    {
        //let user = try? JSONDecoder().decode(type: Decodable.Protocol, from: Usuarios)
        //Las partes en los comentarios las pondre cuando encuentre el error
        var Genero: String = obtenerDatos(key: "Genero") as String
        var Nombre: String = obtenerDatos(key: "Nombre") as String
        var Correo: String = obtenerDatos(key: "e-Mail") as String
        var Edad: String = obtenerDatos(key: "Edad") as String
        var Telefono: String = obtenerDatos(key: "Telefono") as String
        var Ocupacion: String = obtenerDatos(key: "Ocupacion") as String
        
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
        GeneroTXT.text = Genero
        EdadTXT.text =  String(Edad)
        TelefonoTXT.text = Telefono
        OcupacionTXT.text = Ocupacion
    }
    let userDefaults = UserDefaults.standard // clase para almacenar en la memoria
    func obtenerDatos(key: String) -> String{
        userDefaults.synchronize()
        if let valor: String = UserDefaults.standard.string(forKey: key)
        {
            return valor
        }else
        {
            return "Error"
        }
        
    }
    @IBAction func actualizar(sender: Any)
    {
        guardarDatosMemoria(key: "ClaveUsuario", value: NombreTXT.text)
        guardarDatosMemoria(key: "Nombre", value: NombreTXT.text)
        guardarDatosMemoria(key: "e-Mail", value: CorreoTXT.text)
        guardarDatosMemoria(key: "Genero", value: GeneroTXT.text)
        guardarDatosMemoria(key: "Edad", value: EdadTXT.text)
        guardarDatosMemoria(key: "Telefono", value: TelefonoTXT.text)
        guardarDatosMemoria(key: "Ocupacion", value: OcupacionTXT.text)
    }
    func guardarDatosMemoria(key: String, value: Any) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
}
