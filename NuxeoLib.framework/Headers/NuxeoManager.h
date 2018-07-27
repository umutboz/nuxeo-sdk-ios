//
//  NuxeoManager.h
//  NuxeoLib
//
//  Created by Umut BOZ on 25.07.2018.
//  Copyright © 2018 Kocsistem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NUXDocument.h"
#import "NUXRequest.h"
#import "NUXDocuments.h"
#import "NUXSession.h"
#import "NUXBlobStore.h"
#import "NUXSession+requests.h"

@interface NuxeoManager : NSObject{
    
}
@property (nonatomic,strong) NUXSession *session;
@property (nonatomic,strong) NSString *apiPrefix;
@property (nonatomic,strong) NSString *workspace;
@property (nonatomic,strong) NSString *envoirment;

//-(id)initWithSession:(NUXSession*)session
-(id)initWithSession:(NUXSession*)session withPath:(NSString*)path;
-(NSMutableArray<NUXDocument*>*)getDocumentList;
-(NUXRequest*)getDocumentListRequest;
-(NSMutableArray<NUXDocument*>*)getDocumentListWithParent:(NSString*)parent;

-(NUXRequest*)querying:(NSString*)query;

-(NUXRequest*)uploadWithFileName:(NSString*)fileName WithParent:(NSString*)parent;
-(NUXRequest*)uploadWithFileName:(NSString*)fileName DocumentDesc:(NSString*)description WithParent:(NSString*)parent;

//downloadFile(document: NUXDocument, directoryPath: String? = "") -> NUXRequest?
//downloadFile(documentUid: String,documentTitle:String, directoryPath: String? = "") -> NUXRequest?
-(NUXRequest*)downloadFileWithDocument:(NUXDocument*)document DirectoryPath:(NSString*)directoryPath;
-(NUXRequest*)downloadFileUid:(NSString*)uid DocumentTitle:(NSString*)documentTitle DirectoryPath:(NSString*)directoryPath;

+(NUXSession*)getSessionWithUrl:(NSString*)urlString Username:(NSString*)username Password:(NSString*)password;
+(NUXSession*)getSessionWithUrl:(NSString*)urlString Username:(NSString*)username Password:(NSString*)password Repository:(NSString*)repository;
@end
