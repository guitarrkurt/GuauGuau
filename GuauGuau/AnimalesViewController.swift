//
//  ViewController.swift
//  GuauGuau
//
//  Created by guitarrkurt on 06/01/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit
import AVFoundation

class AnimalesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var ViewContenedorBack: UIView!
    @IBOutlet weak var animalesCollectionView: UICollectionView!
    let screenSize = UIScreen.mainScreen().bounds
    var imagenAnimal = "perro.png"
    var sonidoAnimal = "perro"
    
    var arrayAnimalesImage = [
        "gato.png",
        "perro.png",
        "pato.png",
        "leon.png",
        "tigre.png",
        "gallo.png",
        "pollo.png",
        "vaca.png",
        "cerdo.png",
        "oveja.png",
        "caballo.png",
        "aguila.png",
        "abeja.png",
        "perico.png",
        "rana.png",
        "pez.png",
        "buho.png",
        "elefante.png",
        "mono.png",
        "lobo.png",
        "serpiente.png",
        "grillo.png",
        "oso.png",
        "cabra.png"
    ]
    var arrayAnimalesNombre = [
        "gato",
        "perro",
        "pato",
        "leon",
        "tigre",
        "gallo",
        "pollo",
        "vaca",
        "cerdo",
        "oveja",
        "caballo",
        "aguila",
        "abeja",
        "perico",
        "rana",
        "pez",
        "buho",
        "elefante",
        "mono",
        "lobo",
        "serpiente",
        "grillo",
        "oso",
        "cabra"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        //Esta linea de codigo se pone porque xcode mueve nuestro UICollectionViewCell
        self.automaticallyAdjustsScrollViewInsets = false
        
        print("ancho: \(screenSize.width)")
        print("alto: \(screenSize.height)")
        
        
        //SELECCIONAMOS EL SONIDO DE NUESTRO PROYECTO LOCAL
        let filePath = NSBundle.mainBundle().pathForResource("sonidoSelva", ofType: "mp3")
        
        //ALMACENAMOS EL SONIDO EN UNA VARIABLE DE TIPO NSURL
        let fileURL = NSURL(fileURLWithPath: filePath!)
        
        //CREAMOS UNA VARIABLE QUE INDIQUE EL TIPO DE SONIDO
        var soundID:SystemSoundID = 0
        
        //REPRODUCIMOS EL SONIDO
        AudioServicesCreateSystemSoundID(fileURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return arrayAnimalesImage.count
    }
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnimalIdentifier", forIndexPath: indexPath) as! AnimalesCollectionViewCell
        
        cell.imageView.image = UIImage(named: arrayAnimalesImage[indexPath.item])
        cell.etiqueta.text = arrayAnimalesNombre[indexPath.item]
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*Las Celdas ocupen la mitad de la pantalla*/
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width3 = ViewContenedorBack.bounds.width/3
        let width2 = ViewContenedorBack.bounds.width/2
        
        //Si esta en Landscape
        if(UIDevice.currentDevice().orientation.isLandscape.boolValue){
            print("sobre 3")
            return CGSize(width: width3, height: width3);
        }else{
            //Si esta en Portrait
            //Si es iPad
            if(screenSize.width > 414.0){
                            print("sobre 3 414")
                return CGSize(width: width3, height: width3);
            }
            //Sino, si es iPhone
            else{
                            print("sobre 2")
                return CGSize(width: width2, height: width2);
            }
        }

        
    }
    // MARK: - Portrait or Landscape
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        //Es Landscape
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            print("Landscape...")
            
            self.animalesCollectionView.reloadData()
        } else {
            //Es Portrait
            print("Portrait...")
            
            self.animalesCollectionView.reloadData()
        }
    }
    // MARK: - Delegate Collection View
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        imagenAnimal = arrayAnimalesImage[indexPath.item]
        sonidoAnimal = arrayAnimalesNombre[indexPath.item]
        
        print("\(imagenAnimal)")
        performSegueWithIdentifier("EfectosIdentifier", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "EfectosIdentifier"){
            (segue.destinationViewController as! EfectoViewController).imagenAnimal = imagenAnimal
            (segue.destinationViewController as! EfectoViewController).sonidoAnimal = sonidoAnimal
        }
    }
}

