# macosui_starter

![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)

A starter Flutter application for macOS that uses [`macos_ui`](https://pub.dev/packages/macos_ui).

<img src='https://imgur.com/O6XsnEB.png' />

## 🚧 Prerequisites
* Your Flutter version should be at least 3.0
* You should have `mason_cli` installed

## Usage 🚀
```sh
mason make macosui_starter
```

You'll be prompted for the following information:
* The name of your app
* Your app's description
* The name of your organization
* Whether to show the debug label by default
* Whether to add a basic custom system menu bar
* Whether to initialize a git repository
* Whether to add basic multi-window support **_(temporarily disabled)_**

## Variables ✨

| Variable                 | Description                                   | Default                                                 | Type      |
|--------------------------|-----------------------------------------------|---------------------------------------------------------|-----------|
| `app_name`               | The name of your app                          | `macosui_starter`                                       | `string`  |
| `app_description`        | The description of your application           | `A starter Flutter application for macOS with macos_ui` | `string`  |
| `org_name`               | The name of your organization                 | `com.example`                                           | `string`  |
| `debug_label_on`         | Whether to show the debug label by default    | `false`                                                 | `boolean` |
| `custom_system_menu_bar` | Whether to add a basic custom system menu bar | `false`                                                 | `boolean` |
| `initialize_git_repo`    | Whether to initialize a git repository        | `false`                                                 | `boolean` |
| `add_multi_window`       | Whether to add basic multi-window support     | `false`                                                 | `boolean` |

Setting `custom_system_menu_bar` to `true` will add a basic custom system menu bar to your application, which looks 
like this:

<img src='https://imgur.com/yV7RR2E.png' />

### 🚨 A Note About multi-window Support
The `add_multi_window` option worked by using a third-party plugin called `desktop_multi_window`, which creates new 
windows by creating a new instance of the Flutter engine for each window. Unfortunately, this approach means that any 
plugins used by the primary instance are not passed to the new instances. There are workarounds for multiwindow 
applications using plugins that would require data passed between them; As of version 2.0, `macos_ui` uses the 
`macos_window_utils` plugin under the hood, the nature of which won't work with the workarounds.   

Therefore, `add_multi_window` is disabled until multi-window is officially released in the Flutter framework itself. 

## Output 📦

A Flutter application that:
* Targets macOS (support for other platforms can be added manually)
* Has `macos_ui` pre-installed
* Builds basic UI based on the latest version of `macos_ui` 