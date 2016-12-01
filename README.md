# [PasscodeTextField](https://github.com/JQ-miao/PasscodeTextField)
A custom TextField for input passcode.

![himjq.com](http://ohe9u92g1.bkt.clouddn.com/20161130_himjq-1.gif)

## Demo
"[PCTFDemo](https://github.com/JQ-miao/PasscodeTextField/tree/master/PCTFDemo)" is a demo. You can run it on xcode.

## Usage
- Drag the fold "PasscodeTextField" to your project. Import PasscodeTextField.h to your viewController and init
<pre><code>#import "PasscodeTextField.h"</code></pre>
<pre><code>PasscodeTextField *pcTF = [[PasscodeTextField alloc]initWithFrame:..];</code></pre>

## Methods
- Complexity of the passcode, default is 4.
    pcTF.complexity

- Color of elements in the view, default is black.
    pcTF.color

- Size of elements in the view, default is 20.
    pcTF.size

- Style of elements in the view, default is likes iphone view.
    pcTF.style

- A block can get the passcode
    pcTF.getPasscode 
<pre><code>pcTF.getPasscode = ^(NSString *passcode,PasscodeTextField *pcTF){
                   NSLog(@"passcode is : %@",passcode);
               };
</code></pre>

- Show keyboard
    [pcTF showKeyboard]

- Hide keyboard
    [pcTF hideKeyboard]

- Clear filled passcode
    [pcTF clearPasscode]

### Contact me: [himjq.com](http://himjq.com)
