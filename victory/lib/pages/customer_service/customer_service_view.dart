part of 'customer_service.dart';

class VicCustomerServiceView extends StatefulWidget {
  const VicCustomerServiceView({super.key});

  @override
  _VicCustomerServiceViewState createState() => _VicCustomerServiceViewState();
}

class _VicCustomerServiceViewState extends State<VicCustomerServiceView> with WebviewMixin {
  @override
  void initState() {
    final url = "$customerServiceUrl&CUSTOM!user_id=${services.user.id}";
    ensureInitialized();
    webview.loadRequest(Uri.parse(url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        askExit();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: DecoratedBox(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff0336e2), Color(0xff032eca)])),
            child: AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent, // Set the status bar background to white
                statusBarIconBrightness: Brightness.light, // Set icons/text to dark for contrast
              ),
            ),
          ),
        ),
        floatingActionButton: backButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        body: SafeArea(
          top: false,
          child: WebViewWidget(
            controller: webview,
          ),
        ),
      ),
    );
  }
}
