//
//  Managers.swift
//  Owncloud iOs Client
//
//  Created by Gonzalo Gonzalez on 10/3/15.
//

/*
Copyright (C) 2015, ownCloud, Inc.
This code is covered by the GNU Public License Version 3.
For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
You should have received a copy of this license
along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
*/

import UIKit

class Managers: NSObject {
    
    private static var __once1: () = {
            Static.sharedOCCommunication = OCCommunication()
        }()
    
    private static var __once: () = {
            Static.sharedDatabase = FMDatabaseQueue()
            
            let documentsDir = UtilsUrls.getOwnCloudFilePath()
            let dbPath = documentsDir! + "DB.sqlite"
            
            Static.sharedDatabase = FMDatabaseQueue(path: dbPath, flags: SQLITE_OPEN_CREATE|SQLITE_OPEN_READWRITE|SQLITE_OPEN_FILEPROTECTION_NONE)
        }()
    
    //MARK: FMDataBase
    class var sharedDatabase: FMDatabaseQueue {
        
        
        _ = Managers.__once
        
        return Static.sharedDatabase!
    }
    
    
    //MARK: OCCommunication
    class var sharedOCCommunication: OCCommunication {
        struct Static {
            static var sharedOCCommunication: OCCommunication?
            static var tokenCommunication: Int = 0
        }
        
        _ = Managers.__once1
        
        return Static.sharedOCCommunication!
    }
    
    struct Static {
        static var sharedDatabase: FMDatabaseQueue?
        static var sharedOCCommunication: OCCommunication?
        static var tokenDatabase: Int = 0
    }
}






