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

- pcTF.complexity  //Complexity of the passcode, default is 4.
- pcTF.color       //Color of elements in the view, default is black.
- pcTF.size        //Size of elements in the view, default is 20.
- pcTF.style       //Style of elements in the view, default is likes iphone view.
- pcTF.getPasscode //A block can get the passcode.
<pre><code>pcTF.getPasscode = ^(NSString *passcode,PasscodeTextField *pcTF){
                   la.text = [NSString stringWithFormat:@"Passcode is：%@",passcode];
               };
</code></pre>
- showKeyboard
- hideKeyboard
- clearPasscode

### Contact me: [himjq.com](www.himjq.com)
