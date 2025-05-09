import 'package:pharmacy_app/core/services/data_base_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabseStore extends DataBaseSupabase {
  final supbase = Supabase.instance.client;

  // get data supabase
  @override
  Future getDataSupbase({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    try {
      PostgrestTransformBuilder<PostgrestList> data =
          supbase.from(path).select('*');

      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var isDescending = query['ascending'] ?? false;
          data = data.order(orderByField, ascending: !isDescending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }

      var response = await data;
      return response;
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future getCategorySupbase({required String path, String? documentId, Map<String, dynamic>? query}) {
    // TODO: implement getCategorySupbase
    throw UnimplementedError();
  }
}
