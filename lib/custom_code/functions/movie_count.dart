
import '/backend/backend.dart';

int movieCount(List<ListItemsRecord> listItems) {
  return listItems.where((i) => i.listId == "movie_list").toList().length;
}
