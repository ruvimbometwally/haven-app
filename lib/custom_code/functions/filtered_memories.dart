
import '/backend/backend.dart';

List<MemoriesRecord> filteredMemories(
  List<MemoriesRecord> memories,
  String activeMemoryFilter,
) {
  final all = memories;
  final f = activeMemoryFilter;
  if (f == "All") return all;
  return all.where((m) => m.albumId == f).toList();
}
