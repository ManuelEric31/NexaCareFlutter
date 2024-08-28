import 'package:flutter/material.dart';

class TopSlidingButton extends StatefulWidget {
  final List<String> buttonLabels;
  final Function(int) onButtonPressed;
  final int initialIndex;

  const TopSlidingButton({
    Key? key,
    required this.buttonLabels,
    required this.onButtonPressed,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _TopSlidingButtonState createState() => _TopSlidingButtonState();
}

class _TopSlidingButtonState extends State<TopSlidingButton> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.buttonLabels.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onButtonPressed(index);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: _selectedIndex == index
                      ? const Color.fromRGBO(99, 180, 255, 0.1)
                      : Colors.grey[100],
                  side: BorderSide(
                    color: _selectedIndex == index
                        ? const Color.fromRGBO(99, 180, 255, 0.1)
                        : Colors.transparent,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  widget.buttonLabels[index],
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? const Color(0xFF4894FE)
                        : Colors.black,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
