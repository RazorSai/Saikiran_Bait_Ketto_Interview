class AllPostModel{
	String _text;
	bool _selected = false;

	String get text => _text;

	set text(String value) {
		_text = value;
	}

	bool get selected => _selected;

	set selected(bool value) {
		_selected = value;
	}


}