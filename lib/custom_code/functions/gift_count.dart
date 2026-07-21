
import '/backend/backend.dart';

int giftCount(List<ListItemsRecord> listItems) {
  return listItems.where((i) => i.listId == "gift_ideas").toList().length;
}
