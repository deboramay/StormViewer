//
//  DetailViewController.swift
//  Project1
//
//  Created by Anastasia on 16.02.2022.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var selectedImage: String?
  var selectedPictureNumber = 0
  var totalPictures = 0
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    title = "\(selectedPictureNumber) of \(totalPictures)"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    navigationItem.largeTitleDisplayMode = .never
    
    if let imageToLoad = selectedImage {
      imageView.image  = UIImage(named: imageToLoad)
    }
  }
  
  //исчезает верхняя панель навигации при тапании в любое место экрана
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.hidesBarsOnTap = true
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      navigationController?.hidesBarsOnTap = false
  }
  
  //We start with the method name, marked with @objc because this method will get called by the underlying Objective-C operating system (the UIBarButtonItem) so we need to mark it as being available to Objective-C code. When you call a method using #selector you’ll always need to use @objc too.
  @objc func shareTapped() {
      guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
          print("No image found")
          return
      }

      let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
      vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
      present(vc, animated: true)
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
