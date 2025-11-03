import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventManagementProvider extends ChangeNotifier {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;

  Category _selectedCategory = Category.categories[0];
  DateTime? _currentDate;
  TimeOfDay? _currentTime;

  Category get selectedCategory => _selectedCategory;
  DateTime? get currentDate => _currentDate;
  TimeOfDay? get currentTime => _currentTime;


  void setSelectedCategory(int index) {
    if (_selectedCategory.id != Category.categories[index].id) {
      _selectedCategory = Category.categories[index];
      notifyListeners();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _currentDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (newSelectedDate != null) {
      _currentDate = newSelectedDate;
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? newSelectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTime ?? TimeOfDay.now(),
    );
    if (newSelectedTime != null) {
      _currentTime = newSelectedTime;
      notifyListeners();
    }
  }
  
  String getFormattedDate(String chooseDateText) {
    return _currentDate == null
        ? chooseDateText
        : DateFormat("dd/MM/yyyy").format(_currentDate!);
  }
  
  String getFormattedTime(BuildContext context, String chooseTimeText) {
    return _currentTime != null
        ? _currentTime!.format(context)
        : chooseTimeText;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}