//
//  DetailsViewController.m
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

#import "DetailsViewController.h"
#import "BNOLXSTORE-Swift.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *tableView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Details"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        NSArray *arrData = [[NSBundle mainBundle]loadNibNamed:@"ImageTableViewCell" owner:nil options:nil];
        ImageTableViewCell *cell = [[ImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HeaderCell"];
        cell = [arrData objectAtIndex:0];
        [cell updateUIWithData:[self.presenter getClassifiedData]];
        
        return cell;
    } else {
        NSArray *arrData = [[NSBundle mainBundle]loadNibNamed:@"DetailsTableViewCell" owner:nil options:nil];
        DetailsTableViewCell *cell = [[DetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailsCell"];
        cell = [arrData objectAtIndex:0];
        ClassifiedData *data = [self.presenter getClassifiedData];
        [cell updateUIWithName:[data getName] price:[data getPrice] date:[data getPostedDate]];
        
        return cell;
        
        
    }
    
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row == 0 ?  2.8 * tableView.frame.size.height / 4 : 90.0;
}


@end
