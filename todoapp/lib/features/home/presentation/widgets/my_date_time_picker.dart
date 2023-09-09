import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/presentation/cubits/date_cubit/date_cubit.dart';
import 'package:todoapp/features/home/presentation/cubits/date_cubit/date_cubit_state.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({
    Key? key,
    // required this.dateController,
  }) : super(key: key);
  // final TextEditingController dateController;

  @override
  _MyDateTimePickerState createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateTime.now().toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateCubitState>(
      // create: (context) => DateCubit(),
      // child: BlocConsumer<DateCubit, DateCubitState>(
      //   listener: (context, state) => state.maybeWhen(
      //     saving: () => null,
      //     orElse: () => null,
      //   ),
      builder: (context, dateState) {
        return buildDateField(context);
      },
    );
  }

  Widget buildDateField(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? selectedTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2025),
        );
        if (selectedTime != null && selectedTime != DateTime.now()) {
          setState(() => context.read<DateCubit>().updateDate(selectedTime)
              // dateController.text = selectedTime.toIso8601String();
              );
        }
      },
      child: AbsorbPointer(
          child: TextField(
        controller: dateController,
        decoration: const InputDecoration(
          labelText: 'Date',
          suffixIcon: Icon(Icons.date_range),
        ),
      )),
    );
  }
}
