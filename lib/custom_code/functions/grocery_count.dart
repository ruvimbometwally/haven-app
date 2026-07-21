
import '/backend/backend.dart';

int groceryCount(List<ListItemsRecord> listItems) {
  return listItems.where((i) => i.listId == "grocery_list").toList().length;
}
