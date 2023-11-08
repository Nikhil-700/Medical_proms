import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scmia_eprom/constants.dart';

class QuestionCard extends StatefulWidget {
  final int questionIndex;
  final String question;
  final List<String> options;
  final int? selectedOption;
  final Function(int)? onOptionSelected;

  QuestionCard({
    required this.questionIndex,
    required this.question,
    required this.options,
    this.selectedOption,
    this.onOptionSelected,
  });

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75, minWidth: 210),
      child: Card(
        color: background_white,
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: border_gray, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.questionIndex + 1}. ${widget.question}",
                style: GoogleFonts.inter(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: theme_dark,
                ),
              ),
              SizedBox(height: 10.0),
              Column(
                children: widget.options
                    .asMap()
                    .entries
                    .map((entry) => RadioListTile<int>(
                          title: Text(
                            // "${widget.options.indexOf(entry.value) + 1} - ${entry.value}",
                            entry.value.trim(),
                            style: GoogleFonts.inter(
                              color: theme_dark,
                            ),
                          ),
                          value: entry.key,
                          groupValue: selectedOption,
                          fillColor: MaterialStateProperty.all(theme_dark),
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                            if (widget.onOptionSelected != null) {
                              widget.onOptionSelected!(value!);
                            }
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
