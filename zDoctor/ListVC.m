//
//  ListVC.m
//  zDoctor
//
//  Created by David Iskander on 12/4/16.
//  Copyright © 2016 David Iskander. All rights reserved.
//

#import "ListVC.h"

@interface ListVC ()
@property (weak, nonatomic) IBOutlet UIView *dateCard;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@end

@implementation ListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //cell.patientImage.image = [self.patients
    //cell.profileName.text = [self.patientsArray objectAtIndex:indexPath.row];
    //cell.profileDetails.text = [NSString stringWithFormat:@"%@ | %@ | %@", [self.patientsGenderArray objectAtIndex:indexPath.row], [self.patientsAgeArray objectAtIndex:indexPath.row], [self.patientsInsuranceArray objectAtIndex:indexPath.row]];
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
