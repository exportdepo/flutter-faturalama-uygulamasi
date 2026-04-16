import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/routes/app_routes.dart';
import 'core/bloc/locale_cubit.dart';
import 'core/bloc/locale_state.dart';
import 'core/data/hive_database.dart';
import 'core/service_locator.dart' as di;
import 'core/theme/app_theme.dart';
import 'features/billing/presentation/bloc/billing_bloc.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/shop/presentation/bloc/shop_bloc.dart';
import 'features/settings/presentation/bloc/printer_bloc.dart';
import 'features/settings/presentation/bloc/printer_event.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDatabase.init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
              create: (context) => di.sl<ProductBloc>()..add(LoadProducts())),
          BlocProvider<ShopBloc>(
              create: (context) => di.sl<ShopBloc>()..add(LoadShopEvent())),
          BlocProvider<BillingBloc>(
              create: (context) =>
                  BillingBloc(getProductByBarcodeUseCase: di.sl())),
          BlocProvider<PrinterBloc>(
              create: (context) =>
                  di.sl<PrinterBloc>()..add(InitPrinterEvent())),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp.router(
              title: 'Billing App',
              theme: AppTheme.lightTheme,
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('tr'),
                Locale('en'),
              ],
              locale: localeState.locale,
            );
          },
        ),
      ),
    );
  }
}
