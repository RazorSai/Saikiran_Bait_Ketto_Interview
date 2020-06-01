import 'package:flutter/material.dart';

class R{
	static var image = _Image();
	static var color = _Color();
}

class _Image{
	final icon = 'assets/images/icon.png';
	final placeHolder = 'assets/images/user_placeholder.png';
	final menu = 'assets/images/dot_menu.png';
	final like_not_selected = 'assets/images/like_not_selected.png';
	final group_not_selected = 'assets/images/group_not_selected.png';
	final save_not_selected = 'assets/images/save_not_selected.png';
	final share = 'assets/images/share.png';
	final like_selected = 'assets/images/like_selected.png';
	final happy = 'assets/images/happy.png';
	final sad = 'assets/images/sad.png';

	final dashboard = 'assets/images/dashboard.png';
	final library = 'assets/images/book.png';
	final messages = 'assets/images/message.png';
	final services = 'assets/images/services.png';

}

class _Color{
	final light_grey = Color(0xffA5B1C2);
	final dark_grey = Color(0xff545B63);
	final green = Color(0xff00A981);
	final light_green_text = Color(0xffCCEEE6);
	final light_green = Color(0xff00E877);
	final off_dark_white = Color(0xffE8EBEF);
	final background_grey = Color(0xFFE5E5E5);
	final divider = Color(0xFFE8EBEF);
}
