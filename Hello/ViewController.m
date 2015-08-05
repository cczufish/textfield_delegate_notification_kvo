

#import "ViewController.h"

@interface ViewController ()
{
    int num;
}
@end

@implementation ViewController


-(void)testTextField {
    
    _m_TextField = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 80.0f, 150.0f, 30.0f)];
    [_m_TextField setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    _m_TextField.placeholder = @"password"; //默认显示的字
    _m_TextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _m_TextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _m_TextField.returnKeyType = UIReturnKeyDone;
    _m_TextField.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    _m_TextField.delegate = self;
    [_m_TextField addObserver:self forKeyPath:@"text" options:0 context:nil];

    [self.view addSubview:_m_TextField];
    
     [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTextField:) userInfo:nil repeats:YES];
}


- (void)updateTextField:(NSTimer *)timer
{
    NSLog(@"%d",num);
    
    num ++;
    _m_TextField.text = [NSString stringWithFormat:@"a%d",num];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _m_TextField) {
        NSLog(@"%@",_m_TextField.text);
    }
    
    return YES;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if([keyPath isEqualToString:@"text"] && object == _m_TextField) {
        // text has changed
        NSLog(@"%@",_m_TextField.text);

    }
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testTextField];
    num = 0;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:_m_TextField];//通知和delegate一样 都不会走。
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
