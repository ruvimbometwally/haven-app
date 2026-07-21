
import '/backend/backend.dart';

int restaurantCount(List<ListItemsRecord> listItems) {
  return listItems
      .where((i) => i.listId == "restaurant_wishlist")
      .toList()
      .length;
}
