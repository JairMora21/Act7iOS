//
//  ViewController.swift
//  Act7iOS
//
//  Created by Alumno on 12/11/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    // se manda a llamar los elementos del storyboard
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var sliderCollection: UICollectionView!
    var timer : Timer?
    var currentIndex = 0
    
    //Se crea un arreglo de imagenes para mostralos en la galeria de imagenes
    let imgArray = ["audiq52021","audis52021","fordfigo","fordfusion","mazda62020"]

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCollection.delegate = self
        sliderCollection.dataSource = self
        pageView.numberOfPages = imgArray.count
        startTimer()
    }
    
    //Esto es una funcion extra de la aplicacion, lo que hace es que cada 2 segundos esta cambiendo de imagen
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(carToIndex), userInfo: nil, repeats: true)
    }
    
    //esta funcion es parte de la anterior, hace la accion de cambiar de imagen
    @objc func carToIndex(){
        if currentIndex == imgArray.count-1 {
            currentIndex = -1
        } else {
            currentIndex += 1
            sliderCollection.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            pageView.currentPage = currentIndex
        }
    }

    //reornta el numero de imagenes que se va a mostrar
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imgArray.count
    }
    
    //retorna la vista que se va a mostrar
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
        cell.photo.image = UIImage (named:  imgArray[indexPath.row])
        return cell
    }
    
    //le da un tamaño especifico a las imagenes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: sliderCollection.frame.width, height: sliderCollection.frame.height)
    }
    //el espacio entre fotos
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }

}

