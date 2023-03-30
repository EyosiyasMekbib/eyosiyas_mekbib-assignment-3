import 'package:gulit/repository.dart';
import 'package:gulit/model/GroceryItem.dart';

class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveGrocery(GroceryItem groceryItem) async {
    return await _repository!.insertData('grocery', groceryItem.toJson());
  }

  readGrocery() async {
    return await _repository!.readData('grocery');
  }

  updateGrocery(GroceryItem groceryItem) async {
    return await _repository!.updateData('grocery', groceryItem.toJson());
  }

  deleteGrocery(dispatchId) async {
    return await _repository!.deleteData('grocery', dispatchId);
  }

  deleteAllGroceries() async {
    return await _repository!.deleteAllData('grocery');
  }
}
