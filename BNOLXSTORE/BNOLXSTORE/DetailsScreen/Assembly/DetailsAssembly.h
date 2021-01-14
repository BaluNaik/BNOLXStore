//
//  DetailsAssembly.h
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import <UIKit/UIKit.h>

@class ClassifiedData;

@interface DetailsAssembly: NSObject

@property (strong, nonatomic) ClassifiedData* data;

- (id)initWith:(ClassifiedData *)data;
-(UIViewController *)viewModule;

@end

