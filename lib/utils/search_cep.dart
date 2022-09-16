import 'package:dartz/dartz.dart';
import 'package:modavest_core/utils/show_toast.dart';
import 'package:search_cep/search_cep.dart';

Future<ViaCepInfo?> searchCep(String? cep) async {
  final viaCepSearch = ViaCepSearchCep();
  if (cep != null && cep.replaceAll("-", '').length == 8) {
    final Either<SearchCepError, ViaCepInfo> response =
        await viaCepSearch.searchInfoByCep(cep: cep.replaceAll("-", ''));

    return response.fold(
      (l) {
        toast(l.errorMessage);
        return null;
      },
      (r) {
        if (r.cep == null) {
          toast(const InvalidCepError().errorMessage);
          return null;
        }
        return r;
      },
    );
  }
  return null;
}
