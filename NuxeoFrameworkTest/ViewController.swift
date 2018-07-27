//
//  ViewController.swift
//  NuxeoFrameworkTest
//
//  Created by Umut BOZ on 25.07.2018.
//  Copyright © 2018 Kocsistem. All rights reserved.
//

import UIKit
import NuxeoLib

class ViewController: UIViewController {

    let workspace : String = "/path/C6ED68F2-3221-434D-B076-3CABD426F0D1"
    var nuxeoManager : NuxeoManager?
    let sharedSession : NUXSession = NUXSession.sharedSession(withPlistFile: "NUXSession-info")
    var nuxSession2 :  NUXSession?
    var nuxSession1 :  NUXSession?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nuxSession1 = NuxeoManager.getSessionWithUrl("http://localhost:8080/nuxeo", username: "C6ED68F2-3221-434D-B076-3CABD426F0D1", password: "06E64C89-E47A-4958-A87A-70E29D0E560C")
        nuxSession2 = NuxeoManager.getSessionWithUrl("http://localhost:8080/nuxeo", username: "C6ED68F2-3221-434D-B076-3CABD426F0D1", password: "06E64C89-E47A-4958-A87A-70E29D0E560C",repository:self.workspace)
        
        nuxeoManager = NuxeoManager.init(session: nuxSession2, withPath: workspace)
        
        documentListWithParent()
        
        //uploadFile()
        //let list = nuxeoManager?.getDocumentList()
        //documentList()
        
        //downloadFile()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


    func uploadFile() -> Void {
        let uploadRequest = nuxeoManager?.upload(withFileName: "trump.Gif", withParent: "/kocsistem")
        var uploadedDocument : NSMutableDictionary?
        uploadRequest?.start(completionBlock: { (response) in
            print(response?.responseStatusCode)
        }, failureBlock: { (failure) in
            print(failure?.responseStatusCode)
        })
    }

    func documentList() -> Void {
        let documents = nuxeoManager?.getDocumentList() as? [NUXDocument]

        documents?.forEach({ doc  in
            print(doc.title)
        })
    }
    
    func documentListWithParent() -> Void {
        let documents = nuxeoManager?.getDocumentList(withParent:"/***") as? [NUXDocument]
        
        documents?.forEach({ doc  in
            print(doc.title)
        })
    }
        func downloadFile2() -> Void {
            let documents = nuxeoManager?.getDocumentList()
            let downloadedDoc = nuxeoManager?.getDocumentList().firstObject as! NUXDocument
            let downloadRequest = nuxeoManager?.downloadFileUid(downloadedDoc.uid, documentTitle: downloadedDoc.title, directoryPath: "")
            downloadRequest?.start(completionBlock: { (response) in
                print("\(response?.responseStatusCode)")
            }, failureBlock: { (failure) in
                print("\(failure?.responseStatusCode)")
            })
        }
    

    func downloadFile() -> Void {
        let documents = nuxeoManager?.getDocumentList()
        let downloadedDoc = nuxeoManager?.getDocumentList().firstObject as! NUXDocument
        let downloadRequest = nuxeoManager?.downloadFile(with: downloadedDoc,directoryPath : "")
        downloadRequest?.start(completionBlock: { (response) in
            print("\(response?.responseStatusCode)")
        }, failureBlock: { (failure) in
            print("\(failure?.responseStatusCode)")
        })
//        downloadRequest?.setCompletionBlock({ (response) in
//           // print("\(response?.responseStatusCode)")
//        })
//        downloadRequest?.startSynchronous()
    }


}

