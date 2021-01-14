//
//  DetailsInteractor.h
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import <Foundation/Foundation.h>
#import "DetailsInteractorIO.h"

@class ClassifiedData;
@interface DetailsInteractor: NSObject <DetailsInteractorInput>

@property(nonatomic, weak) id<DetailsInteractorOutput> presenter;
@property (strong, nonatomic) ClassifiedData* data;

@end

