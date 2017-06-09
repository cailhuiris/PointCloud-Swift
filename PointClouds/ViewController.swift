//
//  ViewController.swift
//  PointClouds
//
//  Created by David Lee on 2016. 2. 8..
//  Copyright © 2016년 dhlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lastPoint = CGPoint.zero
    var drawingCanvas:PointDrawingCanvas?
    var _library = PointCloudLibrary.getDemoLibrary()
    @IBOutlet var drawingArea:UIView?
    @IBOutlet var label:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        drawingCanvas = PointDrawingCanvas(frame: drawingArea!.bounds)
        drawingCanvas!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        drawingArea!.addSubview(drawingCanvas!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Match pattern, then represent what it is in view controller.
    @IBAction func matchButtonPressed(_ sender:AnyObject?) {
        if let canvas = drawingCanvas {
            if !canvas.isEmpty() {
                let pointCloud = PointCloud("input gesture", canvas.points)
                let matchResult = _library.recognizeFromLibrary(pointCloud)
                let text = "\(matchResult.name), score: \(matchResult.score)"
                self.label!.text = text
            } else {
                self.label!.text = "No match result."
            }
        }
    }
    
    // clear canvas
    @IBAction func clearButtonPressed(_ sender:AnyObject?) {
        if let canvas = drawingCanvas {
            canvas.clearCanvas()
        }
    }
}

