//
//  productoColectionCollectionViewController.swift
//  Ropa Tecnologica
//
//  Created by user260925 on 8/1/24.
//

import UIKit

private let reuseIdentifier = "dataCell"

class productoCollectionViewController: UICollectionViewController {

    private var productos : [Producto] = [Producto(image: "CamisasTec", name: "Camisas Tec"), Producto(image: "SueterTec", name: "SueterTec"),Producto(image: "VestidosTec", name: "Vestido Tec"), Producto(image: "OutiftTec ", name: "OutfitTec"),Producto(image: "OutfutHacker", name: "Outfit Hacker")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        /*self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)*/

        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToMain(segue: UIStoryboardSegue){

               

       }

       

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           if segue.identifier == "showDetail" {
               
               if let indexPaths = collectionView.indexPathsForSelectedItems{
                   
                   let destinationController = segue.destination as! ProductoDetalleViewController
                   
                   
                   destinationController.producto = productos[indexPaths[0].row]
                   
                   
                   collectionView.deselectItem(at: indexPaths[0], animated: false)
                   
                   
               }
               
           }
           }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

                performSegue(withIdentifier: "showDetail", sender: nil)

        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return productos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductoCollectionViewCell
    
        let elemento = productos[indexPath.row]
        cell.productoImage.image = UIImage(named: elemento.image)
        cell.productoName.text = elemento.name
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
