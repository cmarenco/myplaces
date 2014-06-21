//
//  MyPlacesListTableViewController.m
//  MyPlaces
//
//  Created by Christian Marenco on 6/17/14.
//
//

#import "MyPlacesListTableViewController.h"
#import "MyPlace.h"
#import "MyPlacesAddPlaceViewController.h"


@interface MyPlacesListTableViewController ()

@property NSMutableArray *Places;

@end

@implementation MyPlacesListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self inizialization];
    
    [self loadInitialData];
}

-(void)loadInitialData
{
    MyPlace *place1 = [[MyPlace alloc] init];
    place1.name = @"Café del mar";
    place1.description = @"Café de María del mar";
    place1.latitude = @"9.938363";
    place1.longitude = @"-84.070767";
    
    [self.Places addObject:place1];
    
    MyPlace *place2 = [[MyPlace alloc] init];
    place2.name = @"Café Mundo";
    place2.description = @"Café Mediterraneo y comida rica";
    place2.latitude = @"9.937268";
    place2.longitude = @"-84.071886";
    
    [self.Places addObject:place2];
    
}

-(void)inizialization
{
    self.Places = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.Places count];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    MyPlacesAddPlaceViewController *source = [segue sourceViewController];
    MyPlace *item = source.place;
    if (item != nil) {
        [self.Places addObject:item];
        [self.tableView reloadData];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    MyPlace *cellPlace = [self.Places objectAtIndex:indexPath.row];
    cell.textLabel.text = cellPlace.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   /* [tableView deselectRowAtIndexPath:indexPath animated:NO];
    MyPlace *selectedPlace = [self.Places objectAtIndex:indexPath.row];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];*/
}

@end
