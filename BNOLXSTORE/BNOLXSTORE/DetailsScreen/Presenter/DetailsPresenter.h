//
//  DetailsPresenter.h
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import <Foundation/Foundation.h>
#import "DetailsPresenterIO.h"
#import "DetailsInteractor.h"
#import "DetailsViewController.h"

@interface DetailsPresenter: NSObject <DetailsPresenterInput, DetailsInteractorOutput>

@property(nonatomic, strong) id<DetailsInteractorInput> interactor;

- (id)initWith:(DetailsViewController *)controller;

@end

