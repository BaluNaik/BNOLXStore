//
//  DetailsInteractorIO.h
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import <Foundation/Foundation.h>

@class ClassifiedData;

@protocol DetailsInteractorInput <NSObject>

-(ClassifiedData *)getClassifiedData;

@end


@protocol DetailsInteractorOutput <NSObject>

@end
