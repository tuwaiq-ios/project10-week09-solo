//
//  ReadBookVC.swift
//  eBook
//
//  Created by Fno Khalid on 22/04/1443 AH.
//

import UIKit
import PDFKit

class pdfBook1: UIViewController, PDFViewDelegate {
    
    
    var openedBook: String?
    
    //pdf View
    private var pdfView: PDFView?
    
    //pdf document
    private var pdfDocument: PDFDocument?
    
    private var totalPageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // add pdfView to viewController
        pdfView = PDFView(frame: self.view.bounds)
        self.view.addSubview(pdfView!)
        
        
        
        //configure pdf properties
        pdfView?.autoScales = true
        pdfView?.displayMode = .singlePage
        pdfView?.displayDirection = .horizontal
        pdfView?.usePageViewController(true)
        
        
        // pdf path, place pdf file:
        
        print("This is sth:", openedBook ?? "")

        guard let path = Bundle.main.url(forResource: openedBook ?? "" , withExtension: "pdf") else {
            print("unable to locate file")
            
            return
        }
        
        // load pdf
        pdfDocument = PDFDocument(url: path)
        pdfView!.document = pdfDocument
        
        
        //get totalnumber of pages in pdf
        if let total = pdfView?.document?.pageCount {
            totalPageCount = total
        }
        
        //page change
        NotificationCenter.default.addObserver(self, selector: #selector(handlePageChange), name: Notification.Name.PDFViewPageChanged, object: nil)
           
    }
    
    @objc func handlePageChange() {
        // get current page number
        let currentPageNum = pdfDocument!.index(for: (pdfView?.currentPage)!) + 1
        let pageTotalAndCurrentNumber = "\(currentPageNum)/\(totalPageCount)"
        
        
        // cahnge Title
        title = " [\(pageTotalAndCurrentNumber)]"
    }
    
  
        
}

