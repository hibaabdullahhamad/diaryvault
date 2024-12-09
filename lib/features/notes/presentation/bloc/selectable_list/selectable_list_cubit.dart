import 'package:bloc/bloc.dart';
import 'package:dairy_app/core/logger/logger.dart';
import 'package:equatable/equatable.dart';

part 'selectable_list_state.dart';

final log = printer("NotesRepository");

class SelectableListCubit extends Cubit<SelectableListState> {
  SelectableListCubit()
      : super(const SelectableListDisabled(selectedItems: []));

  void enableSelectableList(String item) {
    // when selectable list is enabled an item will be selected as well
    emit(SelectableListEnabled(selectedItems: [item]));
  }

  void disableSelectableList() {
    emit(const SelectableListDisabled(selectedItems: []));
  }

  void addItemToSelection(String item) {
    emit(SelectableListEnabled(selectedItems: [...state.selectedItems, item]));
  }

  void exportSelectedNotes() {
    // Logic to handle exporting selected notes
    if (state.selectedItems.isNotEmpty) {
      emit(SelectableListEnabled(selectedItems: state.selectedItems));
    }
  }

  void removeItemFromSelection(String item) {
    emit(SelectableListEnabled(
        selectedItems:
            state.selectedItems.where((element) => element != item).toList()));
  }

  @override
  void onChange(Change<SelectableListState> change) {
    super.onChange(change);
    log.i(change);
  }
}
