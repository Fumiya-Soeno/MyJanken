//
//  EffectViewController.swift
//  MyJanken
//
//  Created by 添野文哉 on 2020/07/21.
//  Copyright © 2020 fumiya.soeno. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    effectImage.image = originalImage
  }
  var originalImage : UIImage?
  @IBOutlet weak var effectImage: UIImageView!
  let filterArray = [
    "CIPhotoEffectMono",
    "CIPhotoEffectChrome",
    "CIPhotoEffectFade",
    "CIPhotoEffectInstant",
    "CIPhotoEffectNoir",
    "CIPhotoEffectProcess",
    "CIPhotoEffectTonal",
    "CIPhotoEffectTransfer",
    "CISepiaTone"
  ]
  var filterSelectNumber = 0
  @IBAction func effectActionButton(_ sender: Any) {
    
    if let image = originalImage {
      let filterName = filterArray[filterSelectNumber]
      filterSelectNumber += 1
      if filterSelectNumber == filterArray.count {
        filterSelectNumber = 0
      }
      let rotate = image.imageOrientation
      let inputImage = CIImage(image: image)
      guard let effectFilter = CIFilter(name: filterName) else {
        return
      }
      effectFilter.setDefaults()
      effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
      guard let outputImage = effectFilter.outputImage else {
        return
      }
      let ciContext = CIContext(options: nil)
      guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
        return
      }
      effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
    }
    
  }
  @IBAction func shareButtonAction(_ sender: Any) {
    if let shareImage = effectImage.image {
      let shareItems = [shareImage]
      let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
      controller.popoverPresentationController?.sourceView = view
      present(controller, animated: true, completion: nil)
    }
  }
  @IBAction func closeButtonAction(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
}
