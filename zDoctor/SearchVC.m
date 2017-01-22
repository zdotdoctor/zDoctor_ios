//
//  SearchVC.m
//  zDoctor
//
//  Created by David Iskander on 11/20/16.
//  Copyright © 2016 David Iskander. All rights reserved.
//

#import "SearchVC.h"
#import "SearchResultVC.h"

@interface SearchVC ()<UITextViewDelegate, UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *locationView;
@property (weak, nonatomic) IBOutlet UIView *specialityView;
@property (weak, nonatomic) IBOutlet UIView *insuranceView;
@property (weak, nonatomic) IBOutlet UIView *planView;

@property NSString *searchField;

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationView.layer.borderWidth = 0.5;
    self.locationView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.specialityView.layer.borderWidth = 0.5;
    self.specialityView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.insuranceView.layer.borderWidth = 0.5;
    self.insuranceView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.planView.layer.borderWidth = 0.5;
    self.planView.layer.borderColor = [UIColor lightGrayColor].CGColor;

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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName = @"Professionals you checked before ..";
    return sectionName;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}


- (IBAction)onLocationPressed:(UIButton *)sender {
    self.searchField = @"location";
    [self performSegueWithIdentifier:@"location" sender:nil];
}


- (IBAction)onSpecialityPressed:(UIButton *)sender {
    self.searchField = @"speciality";
    [self performSegueWithIdentifier:@"speciality" sender:nil];
}


- (IBAction)onInsurancepressed:(UIButton *)sender {
    self.searchField = @"insurance";
    [self performSegueWithIdentifier:@"insurance" sender:nil];
}

- (IBAction)onPlanPressed:(UIButton *)sender {
    self.searchField = @"plan";
    [self performSegueWithIdentifier:@"plan" sender:nil];
}

- (IBAction)onSearchPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"list" sender:nil];
}












//- (void)textViewDidChange:(UITextView *)textView
//{
//    NSArray *subStrings = [self.searchText.text componentsSeparatedByString:@","];
//    NSLog(@"%@", subStrings);
//}













/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
