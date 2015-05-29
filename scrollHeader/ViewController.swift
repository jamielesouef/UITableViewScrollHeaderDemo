//
//  ViewController.swift
//  scrollHeader
//
//  Created by Jamie Le Souef on 26/05/2015.
//  Copyright (c) 2015 Jamie Le Souef. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerImage: UIImageView!
    
    var scaleFactor: CGFloat!
    var originalImageSize: CGSize!
    var originalImagePosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImage.image = UIImage(named: "header.png")
        headerImage.contentMode = UIViewContentMode.ScaleAspectFill
        headerImage.clipsToBounds = true
        originalImageSize = headerImage.frame.size
        originalImagePosition = headerImage.frame.origin
        scaleFactor = headerImage.frame.size.height / headerImage.frame.size.width
        
        let tableViewHeader =  UIView(frame: CGRect(x: 0, y: 170, width: self.view.frame.width, height: 150))
        
        tableView.tableHeaderView = tableViewHeader
        tableView.delegate = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var scrollOffset:CGFloat = scrollView.contentOffset.y
        var headerImageFrame:CGRect = headerImage.frame

        if scrollOffset < 0 {
            headerImage.frame.size.width =  originalImageSize.width - (scrollOffset)
            headerImage.frame.size.height =  originalImageSize.height - (scrollOffset)
            headerImage.frame.origin.x = originalImagePosition.x - -scrollOffset/2
        } else {
            headerImage.frame.origin.y = -scrollOffset
        }
    }
}

