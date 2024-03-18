import '../services/services.dart';

class Injector {
  StoreService storeService = StoreService();
  StorageService storageService = StorageService();
  // LayoutService layoutService = LayoutService();
  ApiService? apiService;
  String? email;
  // AuthenticationService? authenticationService;
  // DashboardService? dashboardService;

  Future<bool> init() async {
    await storageService.initStorage();
    apiService = ApiService(storeService);
    // authenticationService = AuthenticationService(
    //     storageService: storageService, storeService: storeService);
    // dashboardService = DashboardService(
    //     storageService: storageService, storeService: storeService);
    return true;
  }

  void siEmail(String? value) {
    email = value;
  }
}

Injector si = Injector();
