# Quick Feedback

Quick feedback lets your android and ios app to collect feedback from yours with ease of implementation and with customizations options.

Quick feedback works for both Android and IOS.

# Here how it looks

![Android Quick Feedback](https://raw.githubusercontent.com/sapidlabs/quick-feedback/master/screenshots/QuickFeedback-Android.png "Android Quick Feedback")

![iOS Quick Feedback](https://raw.githubusercontent.com/sapidlabs/quick-feedback/master/screenshots/QuickFeedback-IOS.png "iOS Quick Feedback")

![Android Quick Feedback GIF](https://raw.githubusercontent.com/sapidlabs/quick-feedback/master/screenshots/QuickFeedback.gif "Android Quick Feedback")

### Usage

Add the dependency to your **pubspec.yaml** file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    quick_feedback:
```

### Example: Use within your application.

```dart
  QuickFeedback(
    title: 'Leave a feedback', // Title of dialog
    showTextBox: true, // default false
    textBoxHint:
        'Share your feedback', // Feedback text field hint text default: Tell us more
    submitText: 'SUBMIT', // submit button text default: SUBMIT
    onSubmitCallback: (feedback) {
      print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
      Navigator.of(context).pop();
    },
    askLaterText: 'ASK LATER',
    onAskLaterCallback: () {
      print('Do something on ask later click');
    },
  );
```
### QuickFeedback
The widget expects `title` and `onSubmitCallback` to be provided explicitly.

### Options

1. #### title
Required and must be a string. see example.

2. #### showTextBox
Optional, default is `false`.

3. #### textBoxHint
Placeholder text or hint text within the feedback text box.

4. #### submitText
Optional, default is `SUBMIT`.

5. #### onSubmitCallback
Required, must be a function, with one parameter which gets a map of `{ rating: Int, feedback: String }` see example.

6. #### askLaterText
Optional, default: `ASK ME LATER`

7. #### onAskLaterCallback
Optional, function. gets invoked if provided on Ask me later button press and also closes the dialogue or take to previous page if used on a screen.


## License 
Copyright 2018 @Sapidlabs

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.