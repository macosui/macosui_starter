import 'package:mason/mason.dart';

// Remove this when real multi window is released
const _realMultiWindowReleased = false;

void run(HookContext context) {
  if (!_realMultiWindowReleased) {
    context.vars['add_multi_window'] = false;
    context.vars['multi_window_no_system_menu'] = false;
  }

  /*if (context.vars['add_multi_window'] == true &&
      context.vars['custom_system_menu_bar'] == false) {
    context.vars['multi_window_no_system_menu'] = true;
  } else {
    context.vars['multi_window_no_system_menu'] = false;
  }*/
}
