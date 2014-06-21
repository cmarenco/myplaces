//
//  MyPlacesViewController.m
//  MyPlaces
//
//  Created by Christian Marenco on 6/16/14.
//
//

#import "MyPlacesAddPlaceViewController.h"

@interface MyPlacesAddPlaceViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonDone;


@end

@implementation MyPlacesAddPlaceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.buttonDone) return;
    
    if (self.textFieldName.text.length > 0) {
        self.place = [[MyPlace alloc] init];
        self.place.name = self.textFieldName.text;
    }
}

@end
